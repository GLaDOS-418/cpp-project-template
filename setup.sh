#! /bin/bash

mkdir -p build && cd build
#conan install .. --build=missing --remote=conancenter
cmake .. -G "Ninja" -DCMAKE_BUILD_TYPE=Debug -DCMAKE_C_COMPILER=clang -DCMAKE_CXX_COMPILER=clang++
cmake --build .
cp compile_commands.json ../compile_commands.json
