# Modern C++ Project Template

## CHECKOUT THE [BASIC BRANCH](https://github.com/GLaDOS-418/cpp-project-template/tree/basic) FOR A SIMPLE PROJECT.

A basic project template for modern C++. Cherry-picked the relevant parts from :

- [filipdutescu/modern-cpp-template](https://github.com/filipdutescu/modern-cpp-template)
- [cpp-best-practices/cpp_starter_project](https://github.com/cpp-best-practices/cpp_starter_project)

## Features : Requirements

Use the latest version of everything.

- [x] *Compiler* : clang++, g++
- [x] *Build* : CMake
- [x] *Package Management* : Conan
- [x] *Unit Testing* : Catch2
- [ ] *Static Code Analysers*
- [ ] *Code Formatter*
- [ ] *Code Coverage*
- [ ] consolidate the shipping folder
- [ ] *Docker* support to build and ship applications
- [ ] *CI* using github actions
- [ ] *Doxygen Support*
- [ ] *Mocking Framework*
- [ ] *Fuzz Testing*
- [ ] *Ccache* integration
- [ ] *header file analysers* : include-what-you-use


## Build Instructions

- create application and test executables

```
$ make clean && make build      ## creates bin in build dir
$ cd build/bin                  ## executables <project> and <project>-test
$ ./project                     ## run the application
$ ./project-test                ## run application tests
```

- conan packages are built from within the cmake.
- conan libraries are mentioned inside `cmake/conan_config.cmake`.
- to clear conan cache, run : `$ conan remove -f '*'`
