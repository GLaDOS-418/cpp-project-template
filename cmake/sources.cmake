# sources that are exposed as api
# or which are to be used by the UT framework
# to be added as a library
set(lib_include
    src/include/lib
  )

set(lib_sources
  src/lib/tmp.cpp
)

# sources which are required to start/ bootstrap this project as application
set(exe_include
  src/include
  )

set(exe_sources
  src/source/main.cpp
  )

# sources related to all testing
set(test_sources
  test/src/tmp_test.cpp
  )

set(test_include
  test/include
  )
