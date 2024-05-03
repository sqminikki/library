# SSD1306 Usermode Application

## Objective
Working with C/C++ projects, you often have to adapt them to your project/platform. This assignment focuses on creating a static library from the `ssd1306.c` and `linux_i2c.c` files from the `https://github.com/armlabs/ssd1306_linux` repository and then linking this library to a main executable in a C project using CMake.

## Tasks Overview
The `ssd1306` repository already has a Makefile. You can update the Makefiles `CC` and `CFLAGS` variables to easily cross-compile the project, however this assignment will focus on converting it into a cmake project and creating a static library from the core components.

### Repository Overview
Look through the readme or visit the github page (https://github.com/armlabs/ssd1306_linux)
* There are two source files you’ll need to create the library:

    * `linux_i2c.c` this is the `i2c` usermode driver
    * `ssd1306.c` this is a set of commands to control `SSD1306 OLED Displays`
    * `main.c` this is essentially the user application to control the `SSD1306 OLED`

## 1. Create the Static Library
* Create a static library named `libssd1306.a` from the source files `ssd1306.c` and `linux_i2c.c` using the `https://github.com/armlabs/ssd1306_linux` repository.
* Ensure that the necessary header files are also included in the project.
In cmake you can create a library using `add_library` and make it static using the `STATIC` keyword.

`add_library(ssd1306 STATIC ssd1306.c linux_i2c.c)`

## 2. Writing the Main Program
Add a command called `add_executable` to create the main binary and use the name `ssd1306_bin`.

(The `CMakeLists.txt` from the Static Libraries assignment has an example.)
## 3. Link the main executable with your library.
## 4. Setup CMakeLists.txt
## 5. Building the Application
## 6. Testing
There are three to choose from looking at the layout. `I2C0`, `I2C1`, and `I2C2`.

On the duo, you can run the command duo-pinmux -l and see which support the I2C protocol as well.

* Connect `VCC` from the OLED to pin `36` which is `3V3(OUT)` on the duo.

* Connect `GND` to pin `38` on the duo. (or any ground pin)

* Connect `SCL` to the `I2CX_SCL` (X = 0,1,2) on the duo.

* Connect `SDA` to the `I2CX_SCA` (X = 0,1,2) on the duo.