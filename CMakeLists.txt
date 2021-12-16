cmake_minimum_required(VERSION 3.19)
project(poly)

set(CMAKE_CXX_STANDARD 20)

include(cmake/AddPoly.cmake)

add_subdirectory(deps/glfw)

add_subdirectory(lib)

poly_add_library(mw SHARED
        OUTPUT
        poly_window_manager

        SOURCES
        lib/wm/window_manager.cc

        HEADERS
        include/poly/wm/window_manager.h)