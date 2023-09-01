#!/bin/env bash

export CC=gcc
export CXX=g++
# export CONAN_REVISIONS_ENABLED=1

# export CC=clang
# export CXX=clang++

mkdir -p build && cd build
conan install .. --output-folder=. --build=missing --profile=default
cmake ..  -DCMAKE_BUILD_TYPE=Debug  -DCMAKE_C_COMPILER=${CC} -DCMAKE_CXX_COMPILER=${CXX} --preset conan-release
#
# -DCMAKE_C_COMPILER=clang 
# -DCMAKE_TOOLCHAIN_FILE=build/conan_toolchain.cmake
# -G "Visual Studio 17 2022" -A x64 
#
cmake --build .
