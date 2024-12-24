Cmake note

Executables: Created by add_executable (.exe on Windows, no extension on UNIX)

Loadable modules: Created by add_library with the MODULE option (.dll on Windows, .so on UNIX)

Shared libraries: Created by add_library with the SHARED option on UNIX-like platforms (.so on most UNIX, .dylib on Mac)

Dynamic-link libraries: Created by add_library with the SHARED option on Windows platforms. (.dll)

Import Libraries (.lib most Windows, .dll.a on Cygwin, MinGW)

Static libraries (.lib on windows .a on UNIX, Cygwin, MinGW)

cmake -DCMAKE_INSTALL_PREFIX=/usr/local

# DCMAKE_INSTALL_PREFIX where cmake install software to.

add_executable(target_name source1 source2 ...)

```CMakeLists.txt
cmake_minimum_required(VERSION 3.10)
project(MyProject)

# Define the C++ standard
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Add an executable target
add_executable(MyExecutable main.cpp helper.cpp)
```

# typically a custom CMake script used to encapsulate utility functions, macros, or configurations that are commonly used across a CMake project
internal_utils.cmake

