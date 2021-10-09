cmake_minimum_required(VERSION 3.10)

#
# PROJECT DETAILS
#

set( PROJECT_NAME "project" ) # set from env

project(
  ${PROJECT_NAME}
  VERSION 0.1.0
  LANGUAGES CXX
  )

#
# SET PROJECT OPTIONS
#

include(cmake/build_options.cmake)
include(cmake/static_analyzers.cmake)

if( NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Debug")
endif()


message(STATUS "Started CMake for ${PROJECT_NAME} v${PROJECT_VERSION}...\n")

#
# PREVENT BUILDING IN THE SOURCE DIR
#

if(PROJECT_SOURCE_DIR STREQUAL PROJECT_BINARY_DIR)
  message(FATAL_ERROR "In-source builds not allowed. Please make a new directory (called a build directory) and run CMake from there.\n")
endif()


#
# ENABLE PACKAGE MANAGER
#

include(cmake/conan.cmake)


#
# HEADERS AND IMPL FILES
#
include(cmake/sources.cmake)

add_library( ${PROJECT_NAME}_LIB ${lib_sources})
target_include_directories(${PROJECT_NAME}_LIB PUBLIC  ${lib_include} )

add_executable(${PROJECT_NAME} ${exe_sources})
target_include_directories(${PROJECT_NAME} PUBLIC ${exe_include} )

# LINK LIB WITH EXE
target_link_libraries(${PROJECT_NAME} ${PROJECT_NAME}_LIB)

message(STATUS "Added all header and implementation files.\n")


# COMPILER WARNINGS
#
include(cmake/compiler_options.cmake)
message(STATUS "Applied compiler warnings. Using standard ${CMAKE_CXX_STANDARD}.\n")


#
# Unit testing setup
#

if(${PROJECT_NAME}_ENABLE_UNIT_TESTING)
  enable_testing()
  message(STATUS "Build unit tests for the project. Tests should always be found in the test folder\n")
  # add_subdirectory(test)
endif()