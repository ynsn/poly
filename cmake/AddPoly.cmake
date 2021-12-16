function(poly_add_library lib_name)
    cmake_parse_arguments(ARG
            "STATIC;SHARED"
            "OUTPUT"
            "SOURCES;HEADERS;DEPENDS;ADDITIONAL_INCLUDES"
            ${ARGN})

    # Determine library type: SHARED or STATIC
    if (ARG_STATIC)
        message(STATUS "Building static library ${lib_name}")
        set(LIBRARY_TYPE STATIC)
    else ()
        message(STATUS "Poly: shared library ${lib_name}")
        set(LIBRARY_TYPE SHARED)
    endif ()

    # Create target
    add_library(${lib_name} ${LIBRARY_TYPE} ${ARG_HEADERS} ${ARG_SOURCES})
    add_library(poly::${lib_name} ALIAS ${lib_name})
    target_include_directories(${lib_name} PRIVATE ${CMAKE_SOURCE_DIR}/include ${ARG_ADDITIONAL_INCLUDES})

    # Set output name
    if (ARG_OUTPUT)
        set_target_properties(${lib_name}
                PROPERTIES
                OUTPUT_NAME ${ARG_OUTPUT}
                )
    endif ()
endfunction()