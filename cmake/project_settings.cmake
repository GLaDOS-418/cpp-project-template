#
# Compiler options
#

option(${PROJECT_NAME}_WARNINGS_AS_ERRORS "Treat compiler warnings as errors." OFF)

#
# Sanitizer options
#
option(${PROJECT_NAME}_ENABLE_SANITIZER_ADDRESS "enable asan?" OFF)
option(${PROJECT_NAM}_ENABLE_SANITIZER_LEAK "enable lsan?" OFF)
option(${PROJECT_NAME}_ENABLE_SANITIZER_UNDEFINED_BEHAVIOR "enable ubsan?" OFF)

option(${PROJECT_NAME}_ENABLE_SANITIZER_THREAD "enable tsan? incompatible w/ asan/lsan." OFF)
option(${PROJECT_NAME}_ENABLE_SANITIZER_MEMORY "enable msan? incompatible w/ asan/lsan/tsan." OFF)


#
# Static Analyzers
#

option(${PROJECT_NAME}_ENABLE_CLANG_TIDY "enable clang-tidy" OFF)
#
# Miscelanious options
#

# Generate compile_commands.json for clang based tools
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
