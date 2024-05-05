/**
 * Copyright (c) 2023 Milk-V
 *
 * SPDX-License-Identifier: BSD-3-Clause
 **/

#include <stdio.h>
#include <unistd.h>
#include <stdint.h>

#include <wiringx.h>

#include "bmp280_i2c.h"

int main()
{
    wiringx_init();

    while (1)
    {
        struct bmp280_i2c bmp280 = read_temp_pressure();
        printf("Temp. = %.2f C\n", bmp280.temperature);
        printf("Pressure = %.3f kPa\n", bmp280.pressure);
        sleep(1);
    }
}
