# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.22

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /app

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /app/build

# Include any dependencies generated for this target.
include CMakeFiles/cpparithmetic.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include CMakeFiles/cpparithmetic.dir/compiler_depend.make

# Include the progress variables for this target.
include CMakeFiles/cpparithmetic.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/cpparithmetic.dir/flags.make

CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.o: CMakeFiles/cpparithmetic.dir/flags.make
CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.o: ../doubleops/dadd.cpp
CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.o: CMakeFiles/cpparithmetic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.o"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.o -MF CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.o.d -o CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.o -c /app/doubleops/dadd.cpp

CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.i"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /app/doubleops/dadd.cpp > CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.i

CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.s"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /app/doubleops/dadd.cpp -o CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.s

CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.o: CMakeFiles/cpparithmetic.dir/flags.make
CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.o: ../doubleops/dsubtract.cpp
CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.o: CMakeFiles/cpparithmetic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.o"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.o -MF CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.o.d -o CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.o -c /app/doubleops/dsubtract.cpp

CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.i"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /app/doubleops/dsubtract.cpp > CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.i

CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.s"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /app/doubleops/dsubtract.cpp -o CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.s

CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.o: CMakeFiles/cpparithmetic.dir/flags.make
CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.o: ../doubleops/dmultiply.cpp
CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.o: CMakeFiles/cpparithmetic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.o"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.o -MF CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.o.d -o CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.o -c /app/doubleops/dmultiply.cpp

CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.i"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /app/doubleops/dmultiply.cpp > CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.i

CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.s"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /app/doubleops/dmultiply.cpp -o CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.s

CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.o: CMakeFiles/cpparithmetic.dir/flags.make
CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.o: ../doubleops/ddivide.cpp
CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.o: CMakeFiles/cpparithmetic.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.o"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.o -MF CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.o.d -o CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.o -c /app/doubleops/ddivide.cpp

CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.i"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /app/doubleops/ddivide.cpp > CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.i

CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.s"
	//duo-sdk/riscv64-linux-musl-x86_64/bin/riscv64-unknown-linux-musl-g++ --sysroot=//duo-sdk/rootfs $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /app/doubleops/ddivide.cpp -o CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.s

# Object files for target cpparithmetic
cpparithmetic_OBJECTS = \
"CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.o" \
"CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.o" \
"CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.o" \
"CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.o"

# External object files for target cpparithmetic
cpparithmetic_EXTERNAL_OBJECTS =

libcpparithmetic.a: CMakeFiles/cpparithmetic.dir/doubleops/dadd.cpp.o
libcpparithmetic.a: CMakeFiles/cpparithmetic.dir/doubleops/dsubtract.cpp.o
libcpparithmetic.a: CMakeFiles/cpparithmetic.dir/doubleops/dmultiply.cpp.o
libcpparithmetic.a: CMakeFiles/cpparithmetic.dir/doubleops/ddivide.cpp.o
libcpparithmetic.a: CMakeFiles/cpparithmetic.dir/build.make
libcpparithmetic.a: CMakeFiles/cpparithmetic.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/app/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX static library libcpparithmetic.a"
	$(CMAKE_COMMAND) -P CMakeFiles/cpparithmetic.dir/cmake_clean_target.cmake
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/cpparithmetic.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/cpparithmetic.dir/build: libcpparithmetic.a
.PHONY : CMakeFiles/cpparithmetic.dir/build

CMakeFiles/cpparithmetic.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/cpparithmetic.dir/cmake_clean.cmake
.PHONY : CMakeFiles/cpparithmetic.dir/clean

CMakeFiles/cpparithmetic.dir/depend:
	cd /app/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /app /app /app/build /app/build /app/build/CMakeFiles/cpparithmetic.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/cpparithmetic.dir/depend

