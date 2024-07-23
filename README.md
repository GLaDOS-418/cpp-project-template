# Basic C++ Project setup

## what's here
```
- [x] Compiler                        : g++
- [x] Build                           : cmake
- [x] Package Management              : cpm.cmake
- [x] Unit Testing                    : gtest
```

## available commands
```
$ make build    # conan install dependencies and build
$ make clean    # remove build dirs
$ make rebuild  # clean + build
```

## Project Tree

```
$ tree -I *.cpp -I *.h
.
├── CMakeLists.txt
├── LICENSE
├── README.md
├── app
│   ├── CMakeLists.txt
│   ├── include
│   ├── src
│   └── tests
│       └── CMakeLists.txt
└── libs
    ├── CMakeLists.txt
    ├── dynamic_lib
    │   ├── CMakeLists.txt
    │   ├── include
    │   ├── src
    │   └── tests
    │       └── CMakeLists.txt
    ├── header_only_lib
    │   ├── CMakeLists.txt
    │   └── include
    └── static_lib
        ├── CMakeLists.txt
        ├── include
        ├── src
        └── tests
            └── CMakeLists.txt

```
