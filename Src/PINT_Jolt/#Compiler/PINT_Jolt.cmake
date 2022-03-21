#
# Used to generate PEEL executable.
#

set_option(TARGET_UNIT_TESTS 		OFF)
set_option(TARGET_HELLO_WORLD 		OFF)
set_option(TARGET_PERFORMANCE_TEST 	OFF)
set_option(TARGET_SAMPLES 			OFF)
set_option(TARGET_VIEWER 			OFF)

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

# Group source files
source_group(TREE ${PEEL_REPO_ROOT} FILES ${PINT_JOLT_SRC_FILES})

add_library(PINT_Jolt SHARED ${PINT_JOLT_SRC_FILES})

set_target_properties(PINT_Jolt PROPERTIES
		MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>"
		DEBUG_POSTFIX _D)

target_compile_definitions(PINT_Jolt PRIVATE
		WIN32
		$<IF:$<CONFIG:Debug>,_DEBUG,NDEBUG>
		_WINDOWS
		_USRDLL
		GLUT_NO_LIB_PRAGMA
		PX_PHYSX_STATIC_LIB
		PINT_PHYSX_EXPORTS)

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
