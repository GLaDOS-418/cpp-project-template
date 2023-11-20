# Modern C++ Project Template

### CHECKOUT THE [BASIC BRANCH](https://github.com/GLaDOS-418/cpp-project-template/tree/basic) FOR A SIMPLE PROJECT.

A basic project template for modern C++. Below are some better resources:

- [cpp-best-practices/cpp_starter_project](https://github.com/cpp-best-practices/cpp_starter_project) - ARCHIVED
- [filipdutescu/modern-cpp-template](https://github.com/filipdutescu/modern-cpp-template)
- [cpp-best-practices/cmake_template](https://github.com/cpp-best-practices/cmake_template)

## Features : Requirements

Use the latest version of everything.

- [x] *Compiler*                                      : clang++, g++
- [x] *Build*                                         : CMake
- [x] *Package Management*                            : Conan 2.0
- [x] *Unit Testing*                                  : Catch2
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
- [ ] *header file analysers*                         : include-what-you-use


## Build Instructions

- create application and test executables
- use conan 2.0
- generate a default conan profile. update profile in the `project_build.sh` if not default.

```bash
$ make clean     ## remove build dir
$ make build     ## build project inside build dir
$ make rebuild   ## equivalent to `clean + build`
$ make test      ## run tests from test folder
$ make testprint ## run only failed tests and ouput on stdout
$ make deps      ## installs all conan dependencies
```

- check `project_build.sh` for step by step build process
- to clear conan cache, run : `$ conan remove -f '*'`
- here's a sample conan profile which can be gerenated using the command

``` bash
$ conan profile detect ## creates a default conan profile
$ cat ~/.conan2/profiles/default
[settings]
arch=x86_64
build_type=Debug
compiler=clang
compiler.cppstd=gnu20
compiler.libcxx=libstdc++11
compiler.version=15
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
  grep -rl --color=never 'project-name' | xargs sed -i "s/project-name/${1}/g"
  git init
  git add -f .
  git commit -m "created project ${1}."

  echo " ========================   PROJECT ${1} SETUP COMPLETE.  ======================== "
}
```
