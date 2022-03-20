#
# Used to generate PEEL executable.
#

set(TARGET_UNIT_TESTS OFF CACHE BOOL "Build Unit Tests" FORCE)
set(TARGET_HELLO_WORLD OFF CACHE BOOL "Build Hello World" FORCE)
set(TARGET_PERFORMANCE_TEST OFF CACHE BOOL "Build Performance Test" FORCE)
set(TARGET_SAMPLES OFF CACHE BOOL "Build Samples" FORCE)

add_subdirectory(${PEEL_REPO_ROOT}/Externals/JoltPhysics/Build)

# Source files
set(PINT_JOLT_SRC_FILES
		${PEEL_SOURCE_ROOT}/PINT_Common/PINT_Common.cpp
		${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonShapes.cpp
		${PEEL_SOURCE_ROOT}/PINT_Jolt/PINT_Jolt.cpp
)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
	# Enable Precompiled Headers for PEEL
	set_source_files_properties(${PINT_JOLT_SRC_FILES} PROPERTIES COMPILE_FLAGS "/Yustdafx.h")
	set(PINT_JOLT_SRC_FILES ${PINT_JOLT_SRC_FILES} ${PEEL_SOURCE_ROOT}/PINT_Jolt/stdafx.cpp)
	set_source_files_properties(${PEEL_SOURCE_ROOT}/PINT_Jolt/stdafx.cpp PROPERTIES COMPILE_FLAGS "/Ycstdafx.h")
endif()

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /DPINT_JOLT_EXPORTS")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /DJPH_PROFILE_ENABLED")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /DJPH_DEBUG_RENDERER")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /DJPH_FLOATING_POINT_EXCEPTIONS_ENABLED")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /DPINT_JOLT_EXPORTS")

# Group source files
source_group(TREE ${PEEL_REPO_ROOT} FILES ${PINT_JOLT_SRC_FILES})

# Create PEEL lib
add_library(PINT_Jolt SHARED ${PINT_JOLT_SRC_FILES})

set_target_properties(PINT_Jolt PROPERTIES
		DEBUG_POSTFIX _D)

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
		PUBLIC ${PEEL_REPO_ROOT}/Externals
		PUBLIC ${PEEL_REPO_ROOT}/Private/NVD)

target_link_directories(PINT_Jolt
		PUBLIC "${PEEL_SOURCE_ROOT}/Ice/Lib64"
		PUBLIC "${PEEL_SOURCE_ROOT}/GL"
		PUBLIC "${PEEL_SOURCE_ROOT}/GlutX/Lib"
		PUBLIC "${PEEL_REPO_ROOT}/Externals")

target_link_libraries(PINT_Jolt
		Jolt
		IceCore64
		IceMaths64
		Contact64
		Meshmerizer64
		IceImageWork64
		IceCharacter64
		IceGUI64
		IceRenderer64
		IceTerrain64
		ZCB264
		glew64
		GlutX64_D
		opengl32.lib
		glu32.lib
)
