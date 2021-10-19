# TODO: add option to disable conan

# Setup Conan requires and options here:
#

set(${PROJECT_NAME}_CONAN_REQUIRES "
catch2/2.13.7
")
set(${PROJECT_NAME}_CONAN_OPTIONS "")

#
# If `conan.cmake` (from https://github.com/conan-io/cmake-conan) does not exist, download it.
#
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
  message( STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan...")
  file(DOWNLOAD "https://github.com/conan-io/cmake-conan/raw/v0.15/conan.cmake" "${CMAKE_BINARY_DIR}/conan.cmake")
  message(STATUS "Cmake-Conan downloaded succesfully.")
endif()

include(${CMAKE_BINARY_DIR}/conan.cmake)

conan_add_remote(NAME conancenter 
  URL
  https://center.conan.io
  )

conan_cmake_run(
  REQUIRES
  ${${PROJECT_NAME}_CONAN_REQUIRES} 
  OPTIONS
  ${${PROJECT_NAME}_CONAN_OPTIONS}
  BASIC_SETUP
  CMAKE_TARGETS
  BUILD
  missing
  )

#include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
conan_basic_setup()

message("${CMAKE_BINARY_DIR} ${CMAKE_TARGETS} Conan is setup and all requires have been installed.")
message("${CONAN_LIBS} Conan is setup and all requires have been installed.")
