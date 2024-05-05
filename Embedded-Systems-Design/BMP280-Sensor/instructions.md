Librafy BMP280 example code

This is the last required assignment! I'll have one more that's optional/extra credit.

The BMP280 is a digital barometric pressure sensor produced by Bosch Sensortec. This sensor is designed for precision and flexibility, making it suitable for a wide range of applications, particularly mobile applications like weather forecasting, indoor navigation, fitness tracking, and home automation. Here are the key features of the BMP280. Notice it supports I2C and SPI interfaces. However we'll just use I2C.

You can find the example code at:
https://github.com/milkv-duo/duo-examples/tree/main/i2c/bmp280_i2c


This assigment is similar to the SSD1306 assignment. The code is provided but it's in one file and not ideal to be used with other code in it's current format.

You will have 3 files:
main.c
bmp280_i2c.c
bmp280_i2c.h


The sample code has a main function that does some intialization of the wiringX library. Essencitally up until the  `usleep(250000)` function call. Take `int fd_i2c;` and place it as a global variable (it's currently a local variable) and make it static. `static int fd_i2c;` Do the same with `struct bmp280_calib_param params;` Move it into global space and make it static `static struct bmp280_calib_param params;` The rest of the code can be a `wiringx_init` function (up until the usleep).

The remaining code can be made into it's own function
```c
    int32_t raw_temperature;
    int32_t raw_pressure;

    while (1) {
        bmp280_read_raw(fd_i2c, &raw_temperature, &raw_pressure);
        int32_t temperature = bmp280_convert_temp(raw_temperature, &params);
        int32_t pressure = bmp280_convert_pressure(raw_pressure, raw_temperature, &params);
        printf("Temp. = %.2f C\n", temperature / 100.f);
        printf("Pressure = %.3f kPa\n", pressure / 1000.f);
        // poll every 1s
        sleep(1);
    }
```
Remove the while loop and sleep and save the results to a struct that is returned

```c
struct bmp280_i2c
{
    double temperature;
    double pressure;
};
```

Your function prototype is:
```c
struct bmp280_i2c read_temp_pressure();
```

Here is the header `bmp280_i2c.h`
```c
#include <stdint.h>
#include <unistd.h>

/* Example code to talk to a BMP280 temperature and pressure sensor

   NOTE: Ensure the device is capable of being driven at 3.3v NOT 5v. The Duo
   GPIO (and therefore I2C) cannot be used at 5v.

   You will need to use a level shifter on the I2C lines if you want to run the
   board at 5v.

   Connections on Milk-V Duo board, other boards may vary.

   I2C1_SDA (on Duo this is GPIOC9 (pin 14))  -> SDA on BMP280 board
   I2C1_SCL (on Duo this is GPIOC10 (pin 15)) -> SCL on BMP280 board
   3.3v (pin 36) -> VCC on BMP280 board
   GND (pin 38)  -> GND on BMP280 board
*/

// depends on which port to use
#define I2C_DEV "/dev/i2c-1"

// device has default bus address of 0x76
#define I2C_ADDR 0x76

// hardware registers
#define REG_CONFIG 0xF5
#define REG_CTRL_MEAS 0xF4
#define REG_RESET 0xE0

#define REG_TEMP_XLSB 0xFC
#define REG_TEMP_LSB 0xFB
#define REG_TEMP_MSB 0xFA

#define REG_PRESSURE_XLSB 0xF9
#define REG_PRESSURE_LSB 0xF8
#define REG_PRESSURE_MSB 0xF7

// calibration registers
#define REG_DIG_T1 0x88
#define REG_DIG_T2 0x8A
#define REG_DIG_T3 0x8C

#define REG_DIG_P1 0x8E
#define REG_DIG_P2 0x90
#define REG_DIG_P3 0x92
#define REG_DIG_P4 0x94
#define REG_DIG_P5 0x96
#define REG_DIG_P6 0x98
#define REG_DIG_P7 0x9A
#define REG_DIG_P8 0x9C
#define REG_DIG_P9 0x9E

/*
 * Immutable calibration data read from bmp280
 */
struct bmp280_calib_param
{
    // temperature params
    uint16_t dig_t1;
    int16_t dig_t2;
    int16_t dig_t3;

    // pressure params
    uint16_t dig_p1;
    int16_t dig_p2;
    int16_t dig_p3;
    int16_t dig_p4;
    int16_t dig_p5;
    int16_t dig_p6;
    int16_t dig_p7;
    int16_t dig_p8;
    int16_t dig_p9;
};

void bmp280_read_raw(int fd, int32_t *temp, int32_t *pressure);
void bmp280_init(int fd);
void bmp280_get_calib_params(int fd, struct bmp280_calib_param *params);
int32_t bmp280_convert(int32_t temp, struct bmp280_calib_param *params);
int32_t bmp280_convert_temp(int32_t temp, struct bmp280_calib_param *params);
int32_t bmp280_convert_pressure(int32_t pressure, int32_t temp, struct bmp280_calib_param *params);

struct bmp280_i2c
{
    double temperature;
    double pressure;
};

void wiringx_init();
struct bmp280_i2c read_temp_pressure();
```