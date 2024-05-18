# Modern C++ Project Template

A basic project template for modern C++. Below are some better resources:

- [cpp-best-practices/cpp_starter_project](https://github.com/cpp-best-practices/cpp_starter_project) - ARCHIVED
- [filipdutescu/modern-cpp-template](https://github.com/filipdutescu/modern-cpp-template)
- [cpp-best-practices/cmake_template](https://github.com/cpp-best-practices/cmake_template)

## Features : Requirements

Use the latest version of everything.

- [x] *Compiler*                                      : Clang++
- [x] *Build*                                         : CMake
- [x] *Package Management*                            : Conan 2.0
- [x] *Unit Testing*                                  : Catch2
- [ ] *Static Code Analysers*
- [ ] *Code Formatter*
- [ ] *Code Coverage*
- [ ] consolidate the shipping folder
- [x] *Docker* devcontainer
- [ ] *CI* using github actions
- [ ] *Doxygen Support*
- [ ] *Mocking Framework*
- [ ] *Fuzz Testing*
- [ ] *Ccache* integration
- [ ] *header file analysers*                         : include-what-you-use


## Build Instructions

- create application and test executables
- use conan 2.0
- generate a default conan profile. update profile in the `build` in `makefile` if not default.

```bash
$ make clean     ## remove build dir
$ make deepclean ## remove build dir + remove conan cache
$ make build     ## build project inside build dir
$ make rebuild   ## equivalent to `clean + build`
$ make test      ## run tests from test folder
$ make testprint ## run only failed tests and ouput on stdout
$ make package   ## installs all package dependencies (using conan)
$ make image     ## build docker image using .devcontainer/Dockerfile for dev
$ make terminal  ## start a terminal and load current project dir as a volume
```

- check `build` in `Makefile`  for step by step build process
- to clear conan cache, run : `$ conan remove -f '*'`
- here's a sample conan profile which can be gerenated using the command
- `conan.profile` is used as a custom conan profile.
- docker image generated from `$ make image` is `cppdev:latest`.
- docker container started from `$ make terminal` is `cppdev_container`.

``` bash
$ conan profile detect ## creates a default conan profile
$ cat ~/.conan2/profiles/default
[settings]
arch=x86_64
build_type=Debug
compiler=clang
compiler.cppstd=gnu23
compiler.libcxx=libstdc++11
compiler.version=18
os=Linux
```


### New Project

you can add below function to your `~/.bashrc` to set up new projects.

- `$ new_cpp_project foobar`
- creates a new project, `foobar`, with all the contents of `basic` branch of this repo.
- provide the name of the new project as argument.

```bash
function new_cpp_project {
  if [ ! ${1} ]
  then
    echo "project name not supplied..."
    return
  fi

  git clone --depth 1 --single-branch --branch basic git@github.com:GLaDOS-418/cpp-project-template.git ${1}
  cd ${1}
  /usr/bin/rm -rf .git
  echo "# ${1}" >| README.md
  grep -rl --color=never 'project_name' | xargs sed -i "s/project_name/${1}/g"
  git init
  git add -f .
  git commit -m "created project ${1}."

  echo " ========================   PROJECT ${1} SETUP COMPLETE.  ======================== "
}
```
