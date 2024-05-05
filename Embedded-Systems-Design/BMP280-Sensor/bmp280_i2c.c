#include <stdio.h>

#include <wiringx.h>

#include "bmp280_i2c.h"

void bmp280_read_raw(int fd, int32_t *temp, int32_t *pressure)
{
    // BMP280 data registers are auto-incrementing and we have 3 temperature and
    // pressure registers each, so we start at 0xF7 and read 6 bytes to 0xFC
    // note: normal mode does not require further ctrl_meas and config register writes

    uint8_t buf[6];

    wiringXI2CWrite(fd, REG_PRESSURE_MSB);
    buf[0] = wiringXI2CRead(fd);
    buf[1] = wiringXI2CRead(fd);
    buf[2] = wiringXI2CRead(fd);

    buf[3] = wiringXI2CRead(fd);
    buf[4] = wiringXI2CRead(fd);
    buf[5] = wiringXI2CRead(fd);

    // store the 20 bit read in a 32 bit signed integer for conversion
    *pressure = (buf[0] << 12) | (buf[1] << 4) | (buf[2] >> 4);
    *temp = (buf[3] << 12) | (buf[4] << 4) | (buf[5] >> 4);
}

void bmp280_init(int fd)
{
    // use the "handheld device dynamic" optimal setting (see datasheet)

    // 500ms sampling time, x16 filter
    const uint8_t reg_config_val = ((0x04 << 5) | (0x05 << 2)) & 0xFC;
    wiringXI2CWriteReg8(fd, REG_CONFIG, reg_config_val);

    // osrs_t x1, osrs_p x4, normal mode operation
    const uint8_t reg_ctrl_meas_val = (0x01 << 5) | (0x03 << 2) | (0x03);
    wiringXI2CWriteReg8(fd, REG_CTRL_MEAS, reg_ctrl_meas_val);
}

void bmp280_get_calib_params(int fd, struct bmp280_calib_param *params)
{
    // raw temp and pressure values need to be calibrated according to
    // parameters generated during the manufacturing of the sensor
    // there are 3 temperature params, and 9 pressure params

    params->dig_t1 = (uint16_t)wiringXI2CReadReg16(fd, REG_DIG_T1);
    params->dig_t2 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_T2);
    params->dig_t3 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_T3);

    params->dig_p1 = (uint16_t)wiringXI2CReadReg16(fd, REG_DIG_P1);
    params->dig_p2 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_P2);
    params->dig_p3 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_P3);
    params->dig_p4 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_P4);
    params->dig_p5 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_P5);
    params->dig_p6 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_P6);
    params->dig_p7 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_P7);
    params->dig_p8 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_P8);
    params->dig_p9 = (int16_t)wiringXI2CReadReg16(fd, REG_DIG_P9);
}

// intermediate function that calculates the fine resolution temperature
// used for both pressure and temperature conversions
int32_t bmp280_convert(int32_t temp, struct bmp280_calib_param *params)
{
    // use the 32-bit fixed point compensation implementation given in the
    // datasheet

    int32_t var1, var2;
    var1 = ((((temp >> 3) - ((int32_t)params->dig_t1 << 1))) * ((int32_t)params->dig_t2)) >> 11;
    var2 = (((((temp >> 4) - ((int32_t)params->dig_t1)) * ((temp >> 4) - ((int32_t)params->dig_t1))) >> 12) * ((int32_t)params->dig_t3)) >> 14;
    return var1 + var2;
}

int32_t bmp280_convert_temp(int32_t temp, struct bmp280_calib_param *params)
{
    // uses the BMP280 calibration parameters to compensate the temperature value read from its registers
    int32_t t_fine = bmp280_convert(temp, params);
    return (t_fine * 5 + 128) >> 8;
}

int32_t bmp280_convert_pressure(int32_t pressure, int32_t temp, struct bmp280_calib_param *params)
{
    // uses the BMP280 calibration parameters to compensate the pressure value read from its registers

    int32_t t_fine = bmp280_convert(temp, params);

    int32_t var1, var2;
    uint32_t converted = 0.0;
    var1 = (((int32_t)t_fine) >> 1) - (int32_t)64000;
    var2 = (((var1 >> 2) * (var1 >> 2)) >> 11) * ((int32_t)params->dig_p6);
    var2 += ((var1 * ((int32_t)params->dig_p5)) << 1);
    var2 = (var2 >> 2) + (((int32_t)params->dig_p4) << 16);
    var1 = (((params->dig_p3 * (((var1 >> 2) * (var1 >> 2)) >> 13)) >> 3) + ((((int32_t)params->dig_p2) * var1) >> 1)) >> 18;
    var1 = ((((32768 + var1)) * ((int32_t)params->dig_p1)) >> 15);
    if (var1 == 0)
    {
        return 0; // avoid exception caused by division by zero
    }
    converted = (((uint32_t)(((int32_t)1048576) - pressure) - (var2 >> 12))) * 3125;
    if (converted < 0x80000000)
    {
        converted = (converted << 1) / ((uint32_t)var1);
    }
    else
    {
        converted = (converted / (uint32_t)var1) * 2;
    }
    var1 = (((int32_t)params->dig_p9) * ((int32_t)(((converted >> 3) * (converted >> 3)) >> 13))) >> 12;
    var2 = (((int32_t)(converted >> 2)) * ((int32_t)params->dig_p8)) >> 13;
    converted = (uint32_t)((int32_t)converted + ((var1 + var2 + params->dig_p7) >> 4));
    return converted;
}

static int fd_i2c;
static struct bmp280_calib_param params;

void wiringx_init()
{
    int data = 0;

    if (wiringXSetup("duo", NULL) == -1)
    {
        wiringXGC();
        return;
    }

    if ((fd_i2c = wiringXI2CSetup(I2C_DEV, I2C_ADDR)) < 0)
    {
        printf("I2C Setup failed: %i\n", fd_i2c);
        return;
    }

    // configure BMP280
    bmp280_init(fd_i2c);

    // retrieve fixed compensation params

    bmp280_get_calib_params(fd_i2c, &params);

    usleep(250000); // sleep so that data polling and register update don't collide
}

struct bmp280_i2c read_temp_pressure()
{
    int32_t raw_temperature;
    int32_t raw_pressure;

    bmp280_read_raw(fd_i2c, &raw_temperature, &raw_pressure);
    int32_t temperature = bmp280_convert_temp(raw_temperature, &params);
    int32_t pressure = bmp280_convert_pressure(raw_pressure, raw_temperature, &params);

    struct bmp280_i2c tmp;
    tmp.temperature = temperature / 100.0;
    tmp.pressure = pressure / 1000.0;

    return tmp;
}
