# Phony targets
.PHONY: all clean

# Compiler and flags
CC = gcc
CXX = g++
CFLAGS = -Wall -g
CXXFLAGS = -Wall -g

# Library and object files
C_LIBRARY = libarithmetic.a
CPP_LIBRARY = libcpparithmetic.a
C_OBJECTS = add.o subtract.o multiply.o divide.o
CPP_OBJECTS = dadd.o dsubtract.o ddivide.o dmultiply.o 
HEADERS = intops/int_arithmetic.h doubleops/double_arithmetic.h

# Target for the main executable
TARGET = Arithmetic

# Default target
all: $(TARGET)

# Compile main program and link with both C and C++ libraries
$(TARGET): $(C_LIBRARY) $(CPP_LIBRARY) arithmetic.o
	$(CXX) $(CXXFLAGS) -o $(TARGET) arithmetic.o -L. -larithmetic -lcpparithmetic

# Rule for creating the C static library
$(C_LIBRARY): $(C_OBJECTS)
	ar rcs $(C_LIBRARY) $(C_OBJECTS)
	ranlib $(C_LIBRARY)

# Rule for creating the C++ static library
$(CPP_LIBRARY): $(CPP_OBJECTS)
	ar rcs $(CPP_LIBRARY) $(CPP_OBJECTS)
	ranlib $(CPP_LIBRARY)

# Rule for compiling C source files into object files
%.o: %.c $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

# Rule for compiling C++ source files into object files
%.o: %.cpp $(HEADERS)
	$(CXX) $(CXXFLAGS) -c $< -o $@

# Clean up
clean:
	rm -f $(TARGET) $(C_OBJECTS) $(CPP_OBJECTS) $(C_LIBRARY) $(CPP_LIBRARY) main.o