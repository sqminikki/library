#include "double_arithmetic.h"
#include <iostream>

double divide_double(double a, double b)
{
    if (b == 0)
    {
        std::cerr << "Error: Division by zero is not possible." << std::endl;
        return 0;
    }

    return a / b;
}