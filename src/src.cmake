# Provides WAKAAMA_SIMPLE_CLIENT_DIR and WAKAAMA_SIMPLE_CLIENT_SOURCES variables

include(${CMAKE_CURRENT_LIST_DIR}/wakaama/wakaama.cmake)
set(WAKAAMA_SIMPLE_CLIENT_DIR ${CMAKE_CURRENT_LIST_DIR})

set(WAKAAMA_SIMPLE_CLIENT_INCLUDE_DIRS ${WAKAAMA_SOURCES_DIR} ${WAKAAMA_SIMPLE_CLIENT_DIR})

file(GLOB KNOWN_OBJECTS "${WAKAAMA_SIMPLE_CLIENT_DIR}/lwm2mObjects/*.h")
set(PLATFORM_HEADERS
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/lwm2m_connect.h
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/lwm2m_objects.h
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/lwm2m_objects.hpp
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/object_firmware.hpp
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/object_device.h
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/client_debug.h
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/network.h
    ${KNOWN_OBJECTS}
    )

set(PLATFORM_PRIVATE_HEADERS
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/network/network_utils.h
    )

set(PLATFORM_SOURCES
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/network/network_utils.c
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/network/network_utils.h
    )

if(NOT DONT_USE_POSIX)
    list(APPEND PLATFORM_SOURCES
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/platform/platform_posix.c
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/firmware/firmware_posix.cpp
    )
endif()

if(USE_FREERTOS)
    list(APPEND PLATFORM_SOURCES
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/platform/platform_freertos.c
    )
endif()

if(USE_ESP8266)
    list(APPEND PLATFORM_SOURCES
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/platform/platform_esp8266sdk.c
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/firmware/arduinoOTA.cpp
    )
endif()

if(USE_LWIP)
    list(APPEND PLATFORM_SOURCES ${WAKAAMA_SIMPLE_CLIENT_DIR}/network/network_lwip.c)
else()
    list(APPEND PLATFORM_SOURCES ${WAKAAMA_SIMPLE_CLIENT_DIR}/network/network_posix.c)
endif()

set(WAKAAMA_SIMPLE_CLIENT_SOURCES  ${WAKAAMA_SOURCES} ${PLATFORM_HEADERS} ${PLATFORM_SOURCES} ${PLATFORM_PRIVATE_HEADERS}
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/object_device.c
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/object_security.c
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/object_server.c
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/client_debug.c
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/lwm2m_objects_cpp.cpp
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/lwm2m_objects.c
    ${WAKAAMA_SIMPLE_CLIENT_DIR}/lwm2m_connect.c
    )

