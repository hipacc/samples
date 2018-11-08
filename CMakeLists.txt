# configure build tools
configure_file(buildtools/unix/Makefile.in ${CMAKE_BINARY_DIR}/samples/buildtools/unix/Makefile)

file(GLOB SAMPLE_DIRS ${CMAKE_CURRENT_SOURCE_DIR}/[0-9]*/*)
foreach(SAMPLE_DIR IN LISTS SAMPLE_DIRS)
    # install samples
    install(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${SAMPLE_DIR} DESTINATION samples COMPONENT samples)

    # deploy build tool for samples
    if(IS_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/${SAMPLE_DIR})
        if(UNIX)
            install(FILES ${CMAKE_BINARY_DIR}/samples/buildtools/unix/Makefile DESTINATION ${SAMPLE_DIR} COMPONENT samples)
        elseif(WIN32)
            file(GLOB NMAKE_FILES ${CMAKE_CURRENT_SOURCE_DIR}/buildtools/nmake/*)
            file(GLOB VS2015_FILES ${CMAKE_CURRENT_SOURCE_DIR}/buildtools/vs2015/*)
            install(FILES ${NMAKE_FILES} ${VS2015_FILES} DESTINATION ${SAMPLE_DIR} COMPONENT samples)
        endif()
    endif()
endforeach()
