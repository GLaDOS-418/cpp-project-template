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

include(cmake/conan_config.cmake)


#
# HEADERS AND IMPL FILES
#
include(cmake/sources.cmake)

add_library( ${PROJECT_NAME}-lib ${lib_sources})
target_include_directories(${PROJECT_NAME}-lib PUBLIC  ${lib_include} )

add_executable(${PROJECT_NAME} ${exe_sources})
target_include_directories(${PROJECT_NAME} PUBLIC ${exe_include} )

add_executable(${PROJECT_NAME}-test ${test_sources})
target_include_directories(${PROJECT_NAME}-test PUBLIC ${test_include} )

## add build dependencies
add_dependencies(${PROJECT_NAME}-test ${PROJECT_NAME}-lib)
add_dependencies(${PROJECT_NAME} ${PROJECT_NAME}-lib)

## link lib with exe and test
target_link_libraries(${PROJECT_NAME} ${PROJECT_NAME}-lib)
target_link_libraries(${PROJECT_NAME}-test ${PROJECT_NAME}-lib)

## add conan libs to exe, lib and test
target_link_libraries(${PROJECT_NAME} ${CONAN_LIBS})
target_link_libraries(${PROJECT_NAME}-lib ${CONAN_LIBS})
target_link_libraries(${PROJECT_NAME}-test ${CONAN_LIBS})

message(STATUS "Added all header and implementation files.\n")

# COMPILER WARNINGS
#
include(cmake/compiler_options.cmake)
message(STATUS "Applied compiler warnings. Using standard ${CMAKE_CXX_STANDARD}.\n")


set_target_properties(${PROJECT_NAME}-lib ${PROJECT_NAME}-test ${PROJECT_NAME} PROPERTIES
        CXX_STANDARD 17
)
