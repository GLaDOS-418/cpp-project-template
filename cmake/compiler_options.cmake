#############################################################
### LIST COMPILER WARNINGS
#############################################################

set(CLANG_WARNINGS
      -Wall                      # common set of warnings
      -Wcast-align               # warn for potential performance problem casts
      -Wcast-qual                # warn if casting away const/volatile
      -Wconversion               # warn on type conversions that may lose data
      -Wdouble-promotion         # warn if float is implicitly promoted to double
      -Wextra                    # additional warnings not covered by -Wall
      -Wfloat-equal              # warn on float/double comparisons
      -Wformat-security          # warn on format string security issues
      -Wformat=2                 # extra format string checks
      -Wimplicit-fallthrough     # warn on fallthrough in switch cases
      -Winit-self                # warn on self-initialization
      -Winline                   # warn if a function intended to be inline is not
      -Winvalid-pch              # warn on invalid precompiled headers
      -Wlong-long                # warn on use of long long type
      -Wmissing-braces           # warn on missing braces in initializers
      -Wmissing-field-initializers # warn on partially initialized structs/unions
      -Wmissing-format-attribute # warn on missing format attributes
      -Wmissing-include-dirs     # warn on missing include directories
      -Wmissing-noreturn         # warn on functions missing noreturn attribute
      -Wnon-virtual-dtor         # warn on classes with virtual functions but no virtual destructor
      -Wnull-dereference         # warn on null pointer dereference
      -Wold-style-cast           # warn on C-style casts
      -Woverloaded-virtual       # warn on overloaded (not overridden) virtual functions
      -Wpacked                   # warn on packed structs/classes
      -Wparentheses              # warn on ambiguous parentheses
      -Wpedantic                 # warn on non-standard C++ usage
      -Wpointer-arith            # warn on pointer arithmetic
      -Wredundant-decls          # warn on redundant declarations
      -Wshadow                   # warn on variable shadowing
      -Wsign-conversion          # warn on sign conversions
      -Wstack-protector          # warn on stack protection issues
      -Wstrict-aliasing=2        # warn on strict aliasing rule violations
      -Wswitch-default           # warn on switch statements without default case
      -Wswitch-enum              # warn on unhandled enum values in switch
      -Wuninitialized            # warn on uninitialized variables
      -Wunreachable-code         # warn on unreachable code
      -Wunused                   # warn on unused code elements
      -Wunused-parameter         # warn on unused function parameters
      -Wunused-value             # warn on unused expression results
      -Wunused-variable          # warn on unused variables
      -Wvariadic-macros          # warn on variadic macro usage issues
      -Wwrite-strings            # warn on implicit conversion of string literals to non-const pointers
)

set(GCC_WARNINGS
      ${CLANG_WARNINGS}
      -Wduplicated-branches    # warn if if / else branches have duplicated code
      -Wduplicated-cond        # warn if if / else chain has duplicated conditions
      -Weffc++                 # warn based on Effective C++ by Scott Meyers
      -Wlogical-op             # warn about logical operations being used where bitwise were probably wanted
      -Wmisleading-indentation # warn if indentation implies blocks where blocks do not exist
      -Wdisabled-optimization  # warn when optimizations are disabled
      -Wuseless-cast           # warn if you perform a cast to the same type
)

if (${PROJECT_NAME}_WARNINGS_AS_ERRORS)
  message(TRACE "Warnings are treated as errors")
  list(APPEND CLANG_WARNINGS -Werror)
  list(APPEND GCC_WARNINGS -Werror)
endif()

# depending on build type add debug symbols or optimisation
if ( CMAKE_BUILD_TYPE STREQUAL "Debug" )
  list(APPEND CLANG_WARNINGS -g) # add debug symbols
  list(APPEND GCC_WARNINGS -O0)  # no optimisation
elseif ( CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo" )
  list(APPEND CLANG_WARNINGS -g)
  list(APPEND CLANG_WARNINGS -02)
elseif ( CMAKE_BUILD_TYPE STREQUAL "Release" )
  list(APPEND CLANG_WARNINGS -03)
endif()

# depending on compoiler, select whether to use clang warnings or gcc warnings
if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
  set(PROJECT_WARNINGS_CXX ${CLANG_WARNINGS})
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  set(PROJECT_WARNINGS_CXX ${GCC_WARNINGS})
else()
  message(AUTHOR_WARNING "No compiler warnings set for '${CMAKE_CXX_COMPILER_ID}' compiler.")
endif()

#############################################################
### ADD OPTIONS TO COMPILERS
#############################################################

# add the compiler warnings
add_compile_options(${PROJECT_WARNINGS_CXX})


# Enhance error reporting and compiler messages
if(CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
  add_compile_options(-fcolor-diagnostics)
elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
  add_compile_options(-fdiagnostics-color=always)
else()
  message(STATUS "No colored compiler diagnostic set for '${CMAKE_CXX_COMPILER_ID}' compiler.")
endif()
