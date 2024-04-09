//Samantha Nickole Salas - xso947

#include <stdio.h>
#include "doubleops/double_arithmetic.h"
#include "intops/int_arithmetic.h"

int main()
{
    //Int variables and their values.
    int x = 10;
    int y = 5;

    //Double variables and their values.
    double a = 5.0;
    double b = 3.0;

    //Prints the results of the int arithmetic operations.
    printf("The sum of %d and %d is %d\n", x, y, add(x, y));
    printf("The difference of %d and %d is %d\n", x, y, subtract(x, y));
    printf("The product of %d and %d is %d\n", x, y, multiply(x, y));
    printf("The quotient of %d and %d is %d\n", x, y, divide(x, y));
    printf("---------------------------------------------\n");

    //Prints the results of the double arithmetic operations.
    printf("The sum of %.02lf and %.02lf is %.02lf\n", a, b, add_double(a, b));
    printf("The difference of %.02lf and %.02lf is %.02lf\n", a, b, subtract_double(a, b));
    printf("The product of %.02lf and %.02lf is %.02lf\n", a, b, multiply_double(a, b));
    printf("The quotient of %.02lf and %.02lf is %.02lf\n", a, b, divide_double(a, b));
    return 0;
}