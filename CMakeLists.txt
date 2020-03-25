# cmake_minimum_required(VERSION <specify CMake version here>)
project(cRIPT C)

cmake_minimum_required(VERSION 3.13)

set(CMAKE_C_STANDARD 11)

# Need to set:
#   -DBORINGSSL_DIR="to where boring ssl was built"
#   -DLSQUIC_DIR="to where lsquic was built"
#
# TODO: Do this as an external_project build?
include(cmake/FindBoringSSL.cmake)
include(cmake/FindLsQuic.cmake)

find_package(PkgConfig REQUIRED)
find_package(zlib REQUIRED)





add_subdirectory( riptlib )
add_subdirectory( examples )