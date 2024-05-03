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