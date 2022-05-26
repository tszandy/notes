Cmake note

Executables: Created by add_executable (.exe on Windows, no extension on UNIX)

Loadable modules: Created by add_library with the MODULE option (.dll on Windows, .so on UNIX)

Shared libraries: Created by add_library with the SHARED option on UNIX-like platforms (.so on most UNIX, .dylib on Mac)

Dynamic-link libraries: Created by add_library with the SHARED option on Windows platforms. (.dll)

Import Libraries (.lib most Windows, .dll.a on Cygwin, MinGW)

Static libraries (.lib on windows .a on UNIX, Cygwin, MinGW)

cmake -DCMAKE_INSTALL_PREFIX=/usr/local

# DCMAKE_INSTALL_PREFIX where cmake install software to.
