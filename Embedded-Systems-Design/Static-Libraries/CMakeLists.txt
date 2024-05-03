# Set the minimum version of CMake required
cmake_minimum_required(VERSION 3.10)

# Define the project name and version
project(MixedLanguageApplication VERSION 1.0)

# Specify the C and C++ standards
set(CMAKE_C_STANDARD 11)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_C_STANDARD_REQUIRED True)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Set variables for the library names
set(C_LIBRARY arithmetic)
set(CPP_LIBRARY cpparithmetic)

# Add source files for the executable
add_executable(Arithmetic arithmetic.c)

# Add a static library for C
add_library(${C_LIBRARY} STATIC intops/add.c intops/subtract.c intops/multiply.c intops/divide.c)

# Add a static library for C++
add_library(${CPP_LIBRARY} STATIC doubleops/add.cpp doubleops/subtract.cpp doubleops/multiply.cpp doubleops/divide.cpp)

# Link the executable with both C and C++ libraries
target_link_libraries(example ${C_LIBRARY} ${CPP_LIBRARY})