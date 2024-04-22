# Set the minimum version of CMake required
cmake_minimum_required(VERSION 3.10)

# Define the project name and version
project(ScreenThingy VERSION 1.0)

# Specify the C and C++ standards
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED True)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add source files for the executable
add_executable(ssd1306_bin main.c)

# Add a static library for C code ssd1306.c and linux_i2c.c
add_library(ssd1306 STATIC ssd1306.c linux_i2c.c)

# Link the executable with both C libraries
target_link_libraries(ssd1306_bin ssd1306)