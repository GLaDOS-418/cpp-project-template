# sources that are exposed as api
# or which are to be used by the UT framework
# to be added as a library
set(lib_include
    src/lib/include
  )

set(lib_sources
  src/lib/tmp.cpp
)

# sources which are required to start/ bootstrap this project as application
set(exe_include
  src/driver/include
  )

set(exe_sources
  src/driver/main.cpp
  )

# sources related to all testing
set(test_sources
  test/tests.cpp
  )

set(test_include
  test/include
  )
