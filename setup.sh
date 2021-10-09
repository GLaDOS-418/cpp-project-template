#! /bin/bash

mkdir -p build && cd build
#conan install .. --build=missing --remote=conancenter
cmake .. -G "Ninja" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++
cmake --build .
