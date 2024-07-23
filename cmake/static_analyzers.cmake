############################################
### add clang-tidy
############################################

if(${PROJECT_NAME}_ENABLE_CLANG_TIDY)

  # to use clang-tidy, make sure it's installed in the system
  find_program(CLANGTIDY clang-tidy)

  if(CLANGTIDY)
    # do not clutter the output with throwing warnings for unknowsn items. e.g.
    # warning: unknown warning option '-Wunrecognized-warning'; did you mean '-Wrecognized-warning'?
    set(CMAKE_CXX_CLANG_TIDY ${CLANGTIDY} -extra-arg=-Wno-unknown-warning-option)
    message("clang-tidy finished setting up.")
  else()
    message(SEND_ERROR "clang-tidy requested but executable not found.")
  endif()
endif()


############################################
### TODO: add cppcheck
############################################
