cmake_minimum_required(VERSION 3.23)

### ALL THE SETTINGS APPLICABLE TO THE WHOLE PROJECT RESIDES HERE

# the project name
set(PROJECT_NAME "project_name")

project(${PROJECT_NAME}
  DESCRIPTION ""
  VERSION 0.0.1
  LANGUAGES CXX
)

if( NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE "Debug")
endif()

message(STATUS "Started CMake for ${PROJECT_NAME} v${PROJECT_VERSION}...\n")


# Only set the cxx_standard if it is not set by someone else
if (NOT DEFINED CMAKE_CXX_STANDARD)
  # set c++ standard
  set(CMAKE_CXX_STANDARD 20)
endif()

# make sure c++ standard doesn't decay if it's not available
set(CMAKE_CXX_STANDARD_REQUIRED True)

# set the executable 
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR})

include(./cmake/build_options.cmake)
include(./cmake/compiler_options.cmake)
include(./cmake/sanitizers.cmake)
include(./cmake/project_settings.cmake)

# add the libs first
add_subdirectory(libs)

# then add the dependant apps
add_subdirectory(app)


# Enable testing
include(CTest)
