#
# Used to generate PEEL executable.
#

# Source files
set(PINT_SKELETON_SRC_FILES
		${PEEL_SOURCE_ROOT}/PINT_Common/PINT_Common.cpp
		${PEEL_SOURCE_ROOT}/PINT_Skeleton/PINT_Skeleton.cpp
)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
	# Enable Precompiled Headers for PEEL
	set_source_files_properties(${PINT_SKELETON_SRC_FILES} PROPERTIES COMPILE_FLAGS "/Yustdafx.h")
	set(PINT_SKELETON_SRC_FILES ${PINT_SKELETON_SRC_FILES} ${PEEL_SOURCE_ROOT}/PINT_Skeleton/stdafx.cpp)
	set_source_files_properties(${PEEL_SOURCE_ROOT}/PINT_Skeleton/stdafx.cpp PROPERTIES COMPILE_FLAGS "/Ycstdafx.h")
endif()

# Group source files
source_group(TREE ${PEEL_REPO_ROOT} FILES ${PINT_SKELETON_SRC_FILES})

# Create PEEL lib
add_library(PINT_Skeleton SHARED ${PINT_SKELETON_SRC_FILES})

set_target_properties(PINT_Skeleton PROPERTIES
		DEBUG_POSTFIX _D)

target_compile_definitions(PINT_Skeleton PRIVATE
		WIN32
		_DEBUG
		_WINDOWS
		_USRDLL
		GLUT_NO_LIB_PRAGMA
		PX_PHYSX_STATIC_LIB
		PINT_PHYSX_EXPORTS)

target_include_directories(PINT_Skeleton SYSTEM BEFORE
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

target_link_directories(PINT_Skeleton
		PUBLIC "${PEEL_SOURCE_ROOT}/Ice/Lib64"
		PUBLIC "${PEEL_SOURCE_ROOT}/GL"
		PUBLIC "${PEEL_SOURCE_ROOT}/GlutX/Lib"
		PUBLIC "${PEEL_REPO_ROOT}/Externals")

target_link_libraries(PINT_Skeleton
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
