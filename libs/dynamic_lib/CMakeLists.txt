project(dynamic CXX)

set(DYNAMIC_LIB_TARGET ${PROJECT_NAME})

set(SOURCES src/multiplier.cpp)

add_library(${DYNAMIC_LIB_TARGET} SHARED ${SOURCES} )

target_include_directories(${DYNAMIC_LIB_TARGET} PUBLIC 
  ${CMAKE_CURRENT_SOURCE_DIR}/include
)
