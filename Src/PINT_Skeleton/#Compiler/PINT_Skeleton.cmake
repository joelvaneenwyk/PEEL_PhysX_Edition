#
# Skeleton plugin for PEEL that can be used as a template.
#

macro(target_link_library_config library)
	target_link_libraries(PINT_Skeleton
			debug ${library}${PEEL_SYSTEM_BIN_POSTFIX}_D
			optimized ${library}${PEEL_SYSTEM_BIN_POSTFIX})
endmacro()

# Source files
set(PINT_SKELETON_SRC_FILES
		${PEEL_SOURCE_ROOT}/PINT_Common/PINT_Common.cpp
		${PEEL_SOURCE_ROOT}/PINT_Skeleton/PINT_Skeleton.cpp
		)

# Group source files
source_group(TREE ${PEEL_REPO_ROOT} FILES ${PINT_SKELETON_SRC_FILES})

# Create PEEL lib
add_library(PINT_Skeleton SHARED ${PINT_SKELETON_SRC_FILES})
target_precompile_headers(PINT_Skeleton PRIVATE ${PEEL_SOURCE_ROOT}/PINT_Skeleton/stdafx.h)
set_target_properties(PINT_Skeleton PROPERTIES
		DEBUG_POSTFIX _D)

target_compile_definitions(PINT_Skeleton PRIVATE
		WIN32
		_DEBUG
		_WINDOWS
		_USRDLL
		GLUT_NO_LIB_PRAGMA
		PX_PHYSX_STATIC_LIB
		PINT_SKELETON_EXPORTS)

target_include_directories(PINT_Skeleton SYSTEM BEFORE
		PUBLIC ${PEEL_APPLICATION_ROOT}
		PUBLIC ${PEEL_APPLICATION_ROOT}/Ice/APIs/Ice/Plugins/FlexineSDK
		PUBLIC ${PEEL_APPLICATION_ROOT}/Ice/APIs/Ice
		PUBLIC ${PEEL_APPLICATION_ROOT}/HACD
		PUBLIC ${PEEL_APPLICATION_ROOT}/Glut/include
		PUBLIC ${PEEL_APPLICATION_ROOT}/DevIL/include
		PUBLIC ${PEEL_APPLICATION_ROOT}/PxFoundation
		PUBLIC ${PEEL_APPLICATION_ROOT}/PxFoundation/include
		PUBLIC ${PEEL_REPO_ROOT}/Externals)

target_link_directories(PINT_Skeleton
		PUBLIC "${PEEL_APPLICATION_ROOT}/Ice/Lib${PEEL_SYSTEM_BIN_POSTFIX}"
		PUBLIC "${PEEL_APPLICATION_ROOT}/GL"
		PUBLIC "${PEEL_APPLICATION_ROOT}/GlutX/Lib"
		PUBLIC "${PEEL_REPO_ROOT}/Externals")

target_link_libraries(PINT_Skeleton
		opengl32.lib
		glu32.lib
		glew${PEEL_BIN_ARCH})

target_link_library_config(Contact)
target_link_library_config(IceCharacter)
target_link_library_config(IceCore)
target_link_library_config(IceGUI)
target_link_library_config(IceImageWork)
target_link_library_config(IceMaths)
target_link_library_config(IceRenderer)
target_link_library_config(IceTerrain)
target_link_library_config(Meshmerizer)

target_link_library_config(ZCB2)
target_link_library_config(GlutX)
