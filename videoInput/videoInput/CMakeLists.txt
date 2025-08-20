cmake_minimum_required(VERSION 3.16)
project(videoInput VERSION 1.0)
#LANGUAGES CXX

install(FILES videoInput.h
        DESTINATION include ${CMAKE_INSTALL_INCLUDEDIR})


set(SOURCES
    videoInput.cpp
)

set(HEADERS
   videoInput.h
)

# Define the target for the videoInput library
add_library(videoInput STATIC ${SOURCES} ${HEADERS})

# Set compiler options
target_compile_options(videoInput PRIVATE -O3)

# Set include directories for the library
target_include_directories(videoInput PUBLIC ./)

install(
  TARGETS videoInput
  EXPORT videoInput
  LIBRARY DESTINATION  "${CMAKE_INSTALL_LIBDIR}"
  INCLUDES DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}"
)
