

SET(CMAKE_INCLUDE_CURRENT_DIR ON)
INCLUDE_DIRECTORIES(include)
IF(CMAKE_SYSTEM_NAME STREQUAL "FreeBSD" OR CMAKE_SYSTEM_NAME STREQUAL "Darwin")
    # Find libevent on FreeBSD:
    include_directories( /usr/local/include )
    link_directories( /usr/local/lib )
ENDIF()


FIND_LIBRARY(EVENT_LIB libevent.a)

#Set libript variables
include_directories( ../riptlib/include )


SET(LIBS ript ${LSQUIC_LIB} ${EVENT_LIB} ${BORINGSSL_LIB_ssl} ${BORINGSSL_LIB_crypto} ${ZLIB_LIBRARIES} ${LIBS})

add_executable(ript_server ript_server.c
        prog.c
        test_common.c
        test_cert.c)

add_executable(ript_client
        ript_client.c
        prog.c
        test_common.c
        test_cert.c
        )
LIST(APPEND LIBS pthread m)


target_link_libraries( ript_server ${LIBS})
target_link_libraries( ript_client ${LIBS})
