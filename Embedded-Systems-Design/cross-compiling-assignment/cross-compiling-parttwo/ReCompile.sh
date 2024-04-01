#!/bin/bash

# Use this script for: RE-COMPILE AFTER CHANGES

# set -x # Print commands and their arguments as they are executed
set -e # Exit immediately if a command exits with a non-zero status

# RE-Compile after changes
echo
echo "------------------------------------------------------------"
echo "||   Re-Compiling arithmetic  ||"
echo "------------------------------------------------------------"
echo

docker run --rm -v $PWD:/app -t sqmi/duo-sdk -c "cd build && make"