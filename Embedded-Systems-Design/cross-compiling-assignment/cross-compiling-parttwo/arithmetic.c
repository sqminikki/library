// Samantha Nickole Salas - xso947

#include <stdio.h> 
#include "intops/int_arithmetic.h"
#include "doubleops/double_arithmetic.h"

//#include "double_arithmetic.h"
int main() 
{
    //Int variables and their values.
    int a = 10;
    int b = 5;

    //Double variables and their values.
    double c = 10;
    double d = 5;

    //Declaring int operations and what variables to use here.
    int result1 = add(a, b);
    int result2 = subtract(a, b);
    int result3 = multiply(a, b);
    int result4 = divide(a, b);


    //Declaring double operations and what variables to use here.
    float result5 = add_double(c, d);
    float result6 = subtract_double(c, d);
    float result7 = multiply_double(c, d);
    float result8 = divide_double(c, d);

    //Printing the results of the int operations.
    printf("~~~~~~~~~~~~~~~~intops~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
    printf("The sum of %d and %d is %d\n", a, b, result1);
    printf("The difference of %d and %d is %d\n", a, b, result2);
    printf("The product of %d and %d is %d\n", a, b, result3);
    printf("The quotient of %d and %d is %d\n", a, b, result4);
    printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");

    //Printing the results of the double operations.
    printf("~~~~~~~~~~~~~~~~doubleops~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
    printf("The sum of %.2lf and %.2lf is %f\n", c, d, result5);
    printf("The difference of %.2lf and %.2lf is %f\n", c, d, result6);
    printf("The product of %.2lf and %.2lf is %f\n", c, d, result7);
    printf("The quotient of %.2lf and %.2lf is %f\n", c, d, result8);
    printf("~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~\n");
    return 0;
}