
Super simple image to setup a C++ building environment.
=======================================================

Image contains:
- gcc base image (debian)
- gcc/g++
- cmake
- ninja-build
- gtest
- gdb

Version numbers depend on what is available in the debian repo.



# Usage example

docker run -it -v $(pwd):/home/user/src benoitmartin/cppbuildenv:5.4


