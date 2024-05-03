#!/bin/bash

# set -x # Print commands and their arguments as they are executed
set -e # Exit immediately if a command exits with a non-zero status

# Begin Build Process
echo
echo "||   Building arithmetic  ||"
echo

# Compile libartihmetic for int operations

cd intops

gcc -c add.c -o add.o
gcc -c subtract.c -o subtract.o
gcc -c multiply.c -o multiply.o
gcc -c divide.c -o divide.o
ar rcs libarithmetic.a add.o subtract.o multiply.o divide.o

# Index libarithmetic.a

ranlib libarithmetic.a

# Move libarithmetic.a into working directory
echo
echo Moving library libarithmetic.a into working directory...
echo "------------------------------------------------------------"

mv libarithmetic.a ..

cd ..

# Link libarithmetic.a to a program

# gcc -o arithmetic arithmetic.c -L. -larithmetic

# Clean up artifacts

cd intops

rm add.o
rm subtract.o
rm multiply.o
rm divide.o

cd ..

# Compile libcpparithmetic for double operations

cd doubleops

g++ -c dadd.cpp -o dadd.o
g++ -c dsubtract.cpp -o dsubtract.o
g++ -c dmultiply.cpp -o dmultiply.o
g++ -c ddivide.cpp -o ddivide.o
ar rcs libcpparithmetic.a dadd.o dsubtract.o dmultiply.o ddivide.o

# Index libcpparithmetic.a
ranlib libcpparithmetic.a

# Move libcpparithmetic.a into working directory
echo
echo Moving library libcpparithmetic.a into working directory...
echo "------------------------------------------------------------"

mv libcpparithmetic.a ..

cd ..

# Link libcpparithmetic.a to a program
# g++ -o arithmetic arithmetic-CPP.cpp -L. -lcpparithmetic

# Clean up artifacts

cd doubleops

rm dadd.o
rm dsubtract.o
rm dmultiply.o
rm ddivide.o

cd ..

echo
echo "||     Build complete!    ||"

# Compile arithmetic
g++ -o arithmetic arithmetic.c -L. -larithmetic -lcpparithmetic

echo
echo "||   Compiled arithmetic  ||"

# Run arithmetic

echo
echo "|| Now Running arithmetic ||"
echo
echo "------------------------------------------------------------"

export LD_LIBRARY_PATH=$PWD
./arithmetic

# Clean up artifacts
# rm arithmetic
rm libarithmetic.a
rm libcpparithmetic.a

# echo 
echo "------------------------------------------------------------"
echo Cleaned up artifacts.
# echo