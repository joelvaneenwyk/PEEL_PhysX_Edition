#
# Include Jolt settings to build the library and then use that to create
# a PEEL plugin for Jolt.
#

set_option(TARGET_UNIT_TESTS 		OFF)
set_option(TARGET_HELLO_WORLD 		OFF)
set_option(TARGET_PERFORMANCE_TEST 	OFF)
set_option(TARGET_SAMPLES 			OFF)
set_option(TARGET_VIEWER 			OFF)

set(PHYSICS_REPO_ROOT ${PEEL_REPO_ROOT}/Externals/JoltPhysics)
set(JOLT_PHYSICS_ROOT ${PHYSICS_REPO_ROOT}/Jolt)

# Alternatively, we could include `${JOLT_PHYSICS_ROOT}/Jolt.cmake` but this has the benefit of
# defining a few useful variables in the process which reduces coupling and knowledge of the
# internals of Jolt.
add_subdirectory(${PHYSICS_REPO_ROOT}/Build)

# Source files
set(PINT_JOLT_SRC_FILES
		${PEEL_SOURCE_ROOT}/PINT_Common/PINT_Common.cpp
		${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonShapes.cpp
		${PEEL_SOURCE_ROOT}/PINT_Jolt/PINT_Jolt.cpp
)

# Group source files
source_group(TREE ${PEEL_REPO_ROOT} FILES ${PINT_JOLT_SRC_FILES})

add_library(PINT_Jolt SHARED ${PINT_JOLT_SRC_FILES})
target_precompile_headers(PINT_Jolt PRIVATE ${PEEL_SOURCE_ROOT}/PINT_Jolt/stdafx.h)

if ("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
    # Set compiler flags for various configurations
    set(CMAKE_CXX_FLAGS_DEBUG "/D_DEBUG /GS /Od /Ob0 /RTC1 /DJPH_PROFILE_ENABLED /DJPH_DEBUG_RENDERER")
    set(CMAKE_CXX_FLAGS_RELEASE "/DNDEBUG /GS- /GL /Gy /O2 /Oi /Ot /DJPH_PROFILE_ENABLED /DJPH_DEBUG_RENDERER")
    set(CMAKE_CXX_FLAGS_DISTRIBUTION "/DNDEBUG /GS- /GL /Gy /O2 /Oi /Ot")
    set(CMAKE_CXX_FLAGS_RELEASEASAN "/DNDEBUG /DJPH_PROFILE_ENABLED /DJPH_DISABLE_TEMP_ALLOCATOR /DJPH_DEBUG_RENDERER -fsanitize=address /Od")
    set(CMAKE_CXX_FLAGS_RELEASEUBSAN "/DNDEBUG /DJPH_PROFILE_ENABLED /DJPH_DEBUG_RENDERER -fsanitize=undefined,implicit-conversion")
    set(CMAKE_CXX_FLAGS_RELEASECOVERAGE "/DNDEBUG -fprofile-instr-generate -fcoverage-mapping")

    # Set general compiler flags
    target_compile_options(PINT_Jolt PRIVATE /Zc:__cplusplus /GR- /Gm- /nologo /diagnostics:classic /FC /fp:except- /Zc:inline /Zi /DWIN32 /D_WINDOWS /DUNICODE /D_UNICODE)

    if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
        target_compile_options(PINT_Jolt PRIVATE /MP /fp:fast) # Clang doesn't use fast math because it cannot be turned off inside a single compilation unit

        if (USE_AVX2)
            target_compile_options(PINT_Jolt PRIVATE /arch:AVX2)
        elseif (USE_AVX)
            target_compile_options(PINT_Jolt PRIVATE /arch:AVX)
        endif ()

        if (USE_SSE4_2)
            target_compile_definitions(PINT_Jolt PRIVATE JPH_USE_SSE4_2)
        endif ()

        if (USE_LZCNT)
            target_compile_definitions(PINT_Jolt PRIVATE JPH_USE_LZCNT)
        endif ()

        if (USE_TZCNT)
            target_compile_definitions(PINT_Jolt PRIVATE JPH_USE_TZCNT)
        endif ()

        if (USE_F16C)
            target_compile_definitions(PINT_Jolt PRIVATE JPH_USE_F16C)
        endif ()

        if (USE_FMADD)
            target_compile_definitions(PINT_Jolt PRIVATE JPH_USE_FMADD)
        endif ()
    endif ()
endif ()

set_target_properties(PINT_Jolt PROPERTIES
		MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>"
		DEBUG_POSTFIX _D)

target_compile_definitions(PINT_Jolt PRIVATE
        WIN32
        $<$<CONFIG:Debug>:_DEBUG JPH_PROFILE_ENABLED JPH_DEBUG_RENDERER JPH_FLOATING_POINT_EXCEPTIONS_ENABLED>
        $<$<CONFIG:Release>:NDEBUG JPH_PROFILE_ENABLED JPH_DEBUG_RENDERER JPH_FLOATING_POINT_EXCEPTIONS_ENABLED>
        _WINDOWS
        _USRDLL
        GLUT_NO_LIB_PRAGMA
        PINT_JOLT_EXPORTS)

target_include_directories(PINT_Jolt SYSTEM BEFORE
		PUBLIC ${PEEL_SOURCE_ROOT}
		PUBLIC ${PEEL_SOURCE_ROOT}/Ice/APIs/Ice/Plugins/FlexineSDK
		PUBLIC ${PEEL_SOURCE_ROOT}/Ice/APIs/Ice
		PUBLIC ${PEEL_SOURCE_ROOT}/HACD
		PUBLIC ${PEEL_SOURCE_ROOT}/Glut/include
		PUBLIC ${PEEL_SOURCE_ROOT}/DevIL/include
		PUBLIC ${PEEL_SOURCE_ROOT}/PxFoundation
		PUBLIC ${PEEL_SOURCE_ROOT}/PxFoundation/include
		PUBLIC ${PEEL_SOURCE_ROOT}/
		PUBLIC ${PEEL_REPO_ROOT}/Externals/JoltPhysics
		PUBLIC ${PEEL_REPO_ROOT}/Externals
		PUBLIC ${PEEL_REPO_ROOT}/Private/NVD)

target_link_directories(PINT_Jolt
		PUBLIC "${PEEL_SOURCE_ROOT}/Ice/Lib${PEEL_BIN_ARCH}"
		PUBLIC "${PEEL_SOURCE_ROOT}/GL"
		PUBLIC "${PEEL_SOURCE_ROOT}/GlutX/Lib"
		PUBLIC "${PEEL_REPO_ROOT}/Externals")

macro(target_link_library_config library)
	target_link_libraries(PINT_Jolt
			debug ${library}${PEEL_BIN_ARCH}_D
			optimized ${library}${PEEL_BIN_ARCH})
endmacro()

target_link_libraries(PINT_Jolt
		Jolt
		opengl32.lib
		glu32.lib
		glew${PEEL_BIN_ARCH})

target_link_library_config(IceCore)
target_link_library_config(IceMaths)
target_link_library_config(Contact)
target_link_library_config(Meshmerizer)
target_link_library_config(IceImageWork)
target_link_library_config(IceCharacter)
target_link_library_config(IceGUI)
target_link_library_config(IceRenderer)
target_link_library_config(IceTerrain)
target_link_library_config(GlutX)
