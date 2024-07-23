project(static CXX)

set(STATIC_LIB_TARGET ${PROJECT_NAME})

set(SOURCES src/subtracter.cpp)

add_library(${STATIC_LIB_TARGET} STATIC ${SOURCES})

target_include_directories( ${STATIC_LIB_TARGET} PUBLIC
  ${CMAKE_CURRENT_SOURCE_DIR}/include
)
