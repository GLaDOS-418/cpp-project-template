project(app CXX)

## create a executable name 
set(APP_TARGET_NAME ${PROJECT_NAME}_exe)

## list all the source files
set(SOURCES 
  src/app_main.cpp
  src/foo.cpp
)

## create an executable target for the app using sources
add_executable(${APP_TARGET_NAME} ${SOURCES})


## add headers needed for the app
target_include_directories(${APP_TARGET_NAME} PRIVATE
  ${CMAKE_CURRENT_SOURCE_DIR}/include)


## add required libraries
target_link_libraries(${APP_TARGET_NAME}  PRIVATE static)
target_link_libraries(${APP_TARGET_NAME}  PRIVATE dynamic)
target_link_libraries(${APP_TARGET_NAME}  PRIVATE headerOnly)

