#!/bin/env bash

# export CC=gcc
# export CXX=g++

export CC=clang
export CXX=clang++

mkdir -p build && cd build
conan install .. --output-folder=. --build=missing --profile=default
#cmake ..  -DCMAKE_BUILD_TYPE=Debug  -DCMAKE_CXX_COMPILER=gcc   -DCMAKE_CXX_COMPILER=g++ --preset conan-debug
cmake ..  -DCMAKE_BUILD_TYPE=Debug  -DCMAKE_C_COMPILER=clang   -DCMAKE_CXX_COMPILER=clang++ --preset conan-debug
#
# -DCMAKE_C_COMPILER=clang 
# -DCMAKE_TOOLCHAIN_FILE=build/conan_toolchain.cmake
# -G "Visual Studio 17 2022" -A x64 
#
cmake --build .
