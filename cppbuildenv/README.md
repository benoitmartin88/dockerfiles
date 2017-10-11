
Super simple image to setup a C++ building environment.
=======================================================

Image contains:
- gcc base image (debian)
- gcc/g++
- cmake 3.7
- gtest 1.8

Version numbers depend on what is available in the debian repo.



# Usage example

docker run -it -v $(pwd):/user/src benoitmartin/cppbuildenv:6.2


