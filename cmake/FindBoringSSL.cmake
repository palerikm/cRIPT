


IF (NOT DEFINED BORINGSSL_INCLUDE AND DEFINED BORINGSSL_DIR)
    FIND_PATH(BORINGSSL_INCLUDE NAMES openssl/ssl.h
            PATHS ${BORINGSSL_DIR}/include
            NO_DEFAULT_PATH)
ENDIF()
# This must be done before adding other include directories to take
# precedence over header files from other SSL installs.

IF (BORINGSSL_INCLUDE)
    MESSAGE(STATUS "BoringSSL include directory ${BORINGSSL_INCLUDE}")
    INCLUDE_DIRECTORIES(${BORINGSSL_INCLUDE})
ELSE()
    MESSAGE(FATAL_ERROR "BoringSSL headers not found")
ENDIF()

IF (NOT DEFINED BORINGSSL_LIB AND DEFINED BORINGSSL_DIR)
    FOREACH(LIB_NAME ssl crypto decrepit)
        IF (CMAKE_SYSTEM_NAME STREQUAL Windows)
            FIND_LIBRARY(BORINGSSL_LIB_${LIB_NAME}
                    NAMES ${LIB_NAME}
                    PATHS ${BORINGSSL_DIR}/${LIB_NAME}
                    PATH_SUFFIXES Debug Release MinSizeRel RelWithDebInfo
                    NO_DEFAULT_PATH)
        ELSE()
            FIND_LIBRARY(BORINGSSL_LIB_${LIB_NAME}
                    NAMES lib${LIB_NAME}.a
                    PATHS ${BORINGSSL_DIR}/${LIB_NAME}
                    NO_DEFAULT_PATH)
        ENDIF()
        IF(BORINGSSL_LIB_${LIB_NAME})
            MESSAGE(STATUS "Found ${LIB_NAME} library: ${BORINGSSL_LIB_${LIB_NAME}}")
        ELSE()
            MESSAGE(STATUS "${LIB_NAME} library not found")
        ENDIF()
    ENDFOREACH()

ELSE()
    FOREACH(LIB_NAME ssl crypto decrepit)
        IF (CMAKE_SYSTEM_NAME STREQUAL Windows)
            FIND_LIBRARY(BORINGSSL_LIB_${LIB_NAME}
                    NAMES ${LIB_NAME}
                    PATHS ${BORINGSSL_LIB}
                    PATH_SUFFIXES Debug Release MinSizeRel RelWithDebInfo
                    NO_DEFAULT_PATH)
        ELSE()
            FIND_LIBRARY(BORINGSSL_LIB_${LIB_NAME}
                    NAMES lib${LIB_NAME}.a
                    PATHS ${BORINGSSL_LIB}
                    NO_DEFAULT_PATH)
        ENDIF()
        IF(BORINGSSL_LIB_${LIB_NAME})
            MESSAGE(STATUS "Found ${BORINGSSL_LIB} library: ${BORINGSSL_LIB_${LIB_NAME}}")
        ELSE()
            MESSAGE(STATUS "${BORINGSSL_LIB} library not found")
        ENDIF()
    ENDFOREACH()
    #endif

ENDIF()
