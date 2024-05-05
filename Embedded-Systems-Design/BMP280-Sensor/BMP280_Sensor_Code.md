
# BMP280 Sensor Code for I2C Interface

This is the last required assignment! I'll have one more that's optional/extra credit.

The BMP280 is a digital barometric pressure sensor produced by Bosch Sensortec. This sensor is designed for precision and flexibility, making it suitable for a wide range of applications, particularly mobile applications like weather forecasting, indoor navigation, fitness tracking, and home automation. Here are the key features of the BMP280. Notice it supports I2C and SPI interfaces. However we'll just use I2C.

You can find the example code at:
https://github.com/milkv-duo/duo-examples/tree/main/i2c/bmp280_i2c

This assigment is similar to the SSD1306 assignment. The code is provided but it's in one file and not ideal to be used with other code in it's current format.

You will have 3 files:
`main.c`
`bmp280_i2c.c`
`bmp280_i2c.h`


## `bmp280_i2c.h`

This header is ready to except you might have to adjust the `I2C_DEV` if you're using a different pin.

```c
#ifndef BMP280_I2C_H
#define BMP280_I2C_H

#include <stdint.h>
#include <unistd.h>

// Adjust if necessary
#define I2C_DEV "/dev/i2c-1"

#define I2C_ADDR 0x76

// Hardware registers
#define REG_CONFIG 0xF5
#define REG_CTRL_MEAS 0xF4
#define REG_RESET 0xE0
#define REG_TEMP_XLSB 0xFC
#define REG_TEMP_LSB 0xFB
#define REG_TEMP_MSB 0xFA
#define REG_PRESSURE_XLSB 0xF9
#define REG_PRESSURE_LSB 0xF8
#define REG_PRESSURE_MSB 0xF7

// Calibration registers
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

struct bmp280_calib_param {
    uint16_t dig_t1;
    int16_t dig_t2;
    int16_t dig_t3;
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
int32_t bmp280_convert_temp(int32_t temp, struct bmp280_calib_param *params);
int32_t bmp280_convert_pressure(int32_t pressure, int32_t temp, struct bmp280_calib_param *params);

struct bmp280_i2c {
    double temperature;
    double pressure;
};

void wiringx_init();
struct bmp280_i2c read_temp_pressure();

#endif // BMP280_I2C_H
```

## `bmp280_i2c.c`

The sample code has a main function that does some intialization of the wiringX library. Essentially up until the  `usleep(250000)` function call. Take `int fd_i2c;` and place it as a global variable (it's currently a local variable) and make it static. `static int fd_i2c;` Do the same with `struct bmp280_calib_param params;` Move it into global space and make it static `static struct bmp280_calib_param params;` This will be your `wiringx_init` function (up until the usleep).

The remaining code from `main` can be made into it's own function `struct bmp280_i2c read_temp_pressure()`

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
Start by removing the `while` loop and `sleep` and save the results to a `struct bmp280_i2c` and return. Pay attention to `struct bmp280_i2c`, the types are doubles, so you need to divide temp by 100 and pressure by 1000 before returning.

Lastly, all the functions before main can be copied to `bmp280_i2c.c`. Don't forget to include your `bmp280_i2c.c` header.

## `main.c`

Your main.c will be very minimal (might need additional headers for printf and sleep).

```c
#include "bmp280_i2c.h"

int main() {
    wiringx_init();

    while (1) {
        struct bmp280_i2c result = read_temp_pressure();
        printf("Temperature: %.2f°C, Pressure: %.3fkPa\n", result.temperature, result.pressure);
        sleep(1);
    }

    return 0;
}
```

## Deliverables
- CMakeLists.txt
  - This is similar to the ssd1306 assignment. You'll have a `add_library` for the `bmp280` code, and a `add_executable` for `main.c`, plus `target_link_libraries` to link the library to the executable.
- Source code
  - `bmp280_i2c.c`
  - `bmp280_i2c.h`
  - `main.c`
- Extra Credit
  - Screenshot of your OLED displaying temp and pressure
  - You'll need to include some code from your ssd1306 library.

NOTE: Since we're using wiringx library, use the `milkv_duo.cmake` file from the morse code project.
