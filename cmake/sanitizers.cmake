if(CMAKE_CXX_COMPILER_ID STREQUAL "GNU" OR CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
  set(SANITIZERS "")

  if(${PROJECT_NAME}_ENABLE_SANITIZER_ADDRESS)
    list(APPEND SANITIZERS "address")
  endif()

  if(${PROJECT_NAM}_ENABLE_SANITIZER_LEAK)
    list(APPEND SANITIZERS "leak")
  endif()

  if(${PROJECT_NAME}_ENABLE_SANITIZER_UNDEFINED_BEHAVIOR)
    list(APPEND SANITIZERS "undefined")
  endif()

  if(${PROJECT_NAME}_ENABLE_SANITIZER_THREAD)
    if("address" IN_LIST SANITIZERS OR "leak" IN_LIST SANITIZERS)
      message(WARNING "Thread sanitizer does not work with Address and Leak sanitizer enabled")
    else()
      list(APPEND SANITIZERS "thread")
    endif()
  endif()

  if(${PROJECT_NAME}_ENABLE_SANITIZER_MEMORY AND CMAKE_CXX_COMPILER_ID MATCHES ".*Clang")
    message( WARNING "Memory sanitizer requires all the code (including libc++) to be MSan-instrumented otherwise it reports false positives")

    if("address" IN_LIST SANITIZERS OR "thread" IN_LIST SANITIZERS OR "leak" IN_LIST SANITIZERS)
      message(WARNING "Memory sanitizer does not work with Address, Thread or Leak sanitizer enabled")
    else()
      list(APPEND SANITIZERS "memory")
    endif()
  endif()
endif()

# create a list of all the enabled sanitizers
list( JOIN SANITIZERS "," LIST_OF_SANITIZERS)

# add sanitizers to compiler and liner
if(LIST_OF_SANITIZERS)
  if(NOT "${LIST_OF_SANITIZERS}" STREQUAL "")
    add_compile_options(-fsanitize=${LIST_OF_SANITIZERS})
    add_link_options(-fsanitize=${LIST_OF_SANITIZERS})
  endif()
endif()
