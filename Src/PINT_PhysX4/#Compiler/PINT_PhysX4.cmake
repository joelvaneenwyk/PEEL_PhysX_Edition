#
# Used to generate PEEL executable.
#

macro(target_link_library_config library)
	target_link_libraries(PINT_PhysX4
			debug ${library}${PEEL_SYSTEM_BIN_POSTFIX}_D
			optimized ${library}${PEEL_SYSTEM_BIN_POSTFIX})
endmacro()

set(PEEL_PHYSX4_ROOT_DIR ${PEEL_REPO_ROOT}/Externals/PhysX4)
set(PHYSX_ROOT_DIR ${PEEL_PHYSX4_ROOT_DIR}/physx)
set(PX_OUTPUT_LIB_DIR ${PHYSX_ROOT_DIR})
set(PX_OUTPUT_BIN_DIR ${PHYSX_ROOT_DIR})
set(PXSHARED_PATH ${PEEL_PHYSX4_ROOT_DIR}/pxshared)

set(TARGET_BUILD_PLATFORM windows)

# Override this modules path otherwise we get errors during initial
# setup e.g., "CMake Error at Externals/PhysX4/physx/source/compiler/cmake/CMakeLists.txt:61 (MESSAGE)"
set(CMAKEMODULES_PATH ${PEEL_PHYSX4_ROOT_DIR}/externals/cmakemodules)
set(CMAKEMODULES_NAME CMakeModules)
set(CMAKEMODULES_VERSION 1.27)

set_option(PX_BUILDSNIPPETS OFF)
set_option(PX_BUILDPUBLICSAMPLES OFF)
set_option(PX_GENERATE_STATIC_LIBRARIES OFF)
set_option(NV_USE_STATIC_WINCRT OFF)
set_option(NV_USE_DEBUG_WINCRT $<IF:$<CONFIG:Debug>,ON,OFF>)
set_option(PX_FLOAT_POINT_PRECISE_MATH ON)

if (EXISTS "${PHYSX_ROOT_DIR}/compiler/public")
	add_subdirectory(${PHYSX_ROOT_DIR}/compiler/public)

	# Source files
	set(PINT_PHYSX4_SRC_FILES
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/PINT_PhysX412.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/DelayLoad.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/PINT_PhysX412.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/stdafx.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_Common.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Actor.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_ActorManager.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Allocator.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_CCT.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_ContactModif.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_ContactNotif.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_DebugViz.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Error.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_FilterShader.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Joint.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Mesh.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_PerTestUI.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Queries.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Scene.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Setup.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Shape.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Vehicles.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX4_RCA.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PortalJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/GearJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/RackAndPinion.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtBroadPhase.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtCollection.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtConvexMeshExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtCpuWorkerThread.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtD6Joint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDefaultCpuDispatcher.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDefaultErrorCallback.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDefaultSimulationFilterShader.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDefaultStreams.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDistanceJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtExtensions.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtFixedJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtMetaData.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtPrismaticJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtPvd.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtPxStringTable.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtRaycastCCD.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtRevoluteJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtRigidActorExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtRigidBodyExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSceneQueryExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSimpleFactory.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSmoothNormals.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSphericalJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtTriangleMeshExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctBoxController.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCapsuleController.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCharacterController.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCharacterControllerCallbacks.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCharacterControllerManager.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctController.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctObstacleContext.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctSweptBox.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctSweptCapsule.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctSweptVolume.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonShapes.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/PhysX5/PhysX5_ExtDefaultCpuDispatcher.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/PhysX5/PhysX5_ExtCpuWorkerThread.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/GearJoint.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_Common.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Actor.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_ActorManager.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Allocator.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_CCT.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_ContactModif.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_ContactNotif.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_DebugViz.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Error.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_FilterShader.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Joint.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Mesh.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_PerTestUI.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Queries.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Scene.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Setup.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Shape.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonPhysX3_Vehicles.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_CommonShapes.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PINT_Ice.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PortalJoint.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PxGearJoint.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PxPortalJoint.h
			${PEEL_SOURCE_ROOT}/PINT_Common/PxRackAndPinionJoint.h
			${PEEL_SOURCE_ROOT}/PINT_Common/RackAndPinion.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctBoxController.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCapsuleController.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCharacterController.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCharacterControllerManager.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctController.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctInternalStructs.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctObstacleContext.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctSweptBox.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctSweptCapsule.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctSweptVolume.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctUtils.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtConstraintHelper.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtCpuWorkerThread.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtD6Joint.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDefaultCpuDispatcher.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDistanceJoint.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtFixedJoint.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtInertiaTensor.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtJoint.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtJointMetaDataExtensions.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtPlatform.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtPrismaticJoint.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtPvd.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtRevoluteJoint.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSerialization.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSharedQueueEntryPool.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSphericalJoint.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtTaskQueueHelper.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/PhysX5/PhysX5_ExtCpuWorkerThread.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/PhysX5/PhysX5_ExtDefaultCpuDispatcher.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/PINT_PhysX412.h
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/stdafx.h
			)

	set_source_files_properties(
			${PEEL_SOURCE_ROOT}/PINT_Common/PortalJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/GearJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_Common/RackAndPinion.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtBroadPhase.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtConvexMeshExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtCollection.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtD6Joint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtCpuWorkerThread.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDefaultCpuDispatcher.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDefaultErrorCallback.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDefaultStreams.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDefaultSimulationFilterShader.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtDistanceJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtFixedJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtExtensions.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtMetaData.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtPrismaticJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtPvd.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtPxStringTable.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtRevoluteJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtRaycastCCD.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtRigidActorExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSimpleFactory.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtRigidBodyExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSceneQueryExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSmoothNormals.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtSphericalJoint.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/Extensions/ExtTriangleMeshExt.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctBoxController.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctObstacleContext.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCharacterControllerManager.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCapsuleController.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctController.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCharacterControllerCallbacks.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctSweptCapsule.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctCharacterController.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctSweptBox.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/CCT/CctSweptVolume.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/PhysX5/PhysX5_ExtDefaultCpuDispatcher.cpp
			${PEEL_SOURCE_ROOT}/PINT_PhysX4/PhysX5/PhysX5_ExtCpuWorkerThread.cpp
			PROPERTIES SKIP_PRECOMPILE_HEADERS ON)

	# Group source files
	source_group(TREE ${PEEL_REPO_ROOT} FILES ${PINT_PHYSX4_SRC_FILES})

	# Create PEEL lib
	add_library(PINT_PhysX4 SHARED ${PINT_PHYSX4_SRC_FILES})

	target_precompile_headers(PINT_PhysX4 PRIVATE ${PEEL_SOURCE_ROOT}/PINT_PhysX4/stdafx.h)

	set_target_properties(PINT_PhysX4 PROPERTIES
			DEBUG_POSTFIX _D
			ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<IF:$<CONFIG:Debug>,Debug,Release>"
			LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<IF:$<CONFIG:Debug>,Debug,Release>"
			RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<IF:$<CONFIG:Debug>,Debug,Release>")

	target_link_options(PINT_PhysX4
			PRIVATE /NODEFAULTLIB:LIBCMT)

	target_compile_definitions(PINT_PhysX4 PRIVATE
			WIN32
			$<IF:$<CONFIG:Debug>,_DEBUG,NDEBUG>
			_WINDOWS
			_USRDLL
			GLUT_NO_LIB_PRAGMA
			PX_PHYSX_STATIC_LIB
			PINT_PHYSX_EXPORTS)

	target_include_directories(PINT_PhysX4 SYSTEM BEFORE
			PUBLIC ${PEEL_REPO_ROOT}/Src
			PUBLIC ${PEEL_REPO_ROOT}/Externals
			PUBLIC ${PEEL_SOURCE_ROOT}
			PUBLIC ${PEEL_SOURCE_ROOT}/PINT_PhysX4
			PUBLIC ${PEEL_APPLICATION_ROOT}
			PUBLIC ${PEEL_APPLICATION_ROOT}/DevIL/include
			PUBLIC ${PEEL_APPLICATION_ROOT}/Glut/include
			PUBLIC ${PEEL_APPLICATION_ROOT}/HACD
			PUBLIC ${PEEL_APPLICATION_ROOT}/Ice/APIs/Ice
			PUBLIC ${PEEL_APPLICATION_ROOT}/Ice/APIs/Ice/Plugins/FlexineSDK
			PUBLIC ${PEEL_APPLICATION_ROOT}/PxFoundation
			PUBLIC ${PEEL_APPLICATION_ROOT}/PxFoundation/include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include/characterkinematic
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include/common
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include/cooking
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include/extensions
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include/foundation
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include/geometry
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include/physxprofilesdk
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include/pxtask
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/include/vehicle
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/source/Common/src
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/source/foundation
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/source/foundation/include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/source/geomutils/include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/source/physxextensions/src
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include/extensions
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include/geometry
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include/foundation
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Source/foundation
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Source/foundation/include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Source/Common/src
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include/common
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include/pxtask
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include/physxprofilesdk
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include/cooking
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/pxshared/trunk/include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/pxshared/include/trunk/include/stdint
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/pxshared/include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/pxshared/trunk/src/pvd/include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include/vehicle
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Source/PhysXGpu/include
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/source/physxextensions/src/serialization/File
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/source/pvd/include/
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/Include/characterkinematic
			PUBLIC ${PEEL_PHYSX4_ROOT_DIR}/physx/source/geomutils/include)

	target_link_directories(PINT_PhysX4
			PUBLIC "${PEEL_APPLICATION_ROOT}/Ice/Lib${PEEL_SYSTEM_BIN_POSTFIX}"
			PUBLIC "${PEEL_APPLICATION_ROOT}/GL"
			PUBLIC "${PEEL_APPLICATION_ROOT}/GlutX/Lib"
			PUBLIC "${PEEL_REPO_ROOT}/Externals"
			PUBLIC "${PEEL_REPO_ROOT}/PhysX4/physx/compiler/vc17win64/sdk_source_bin")

	target_link_libraries(PINT_PhysX4
			FastXml
			LowLevel
			LowLevelAABB
			LowLevelDynamics
			PhysX
			PhysXCharacterKinematic
			PhysXCommon
			PhysXCooking
			PhysXExtensions
			PhysXFoundation
			PhysXPvdSDK
			PhysXTask
			PhysXVehicle
			SceneQuery
			SimulationController
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

	macro(copy_physx_library filename)
		add_custom_command(
				TARGET PINT_PhysX4 POST_BUILD
				COMMAND ${CMAKE_COMMAND} -E $<IF:$<CONFIG:Debug>,copy,true>
				${PX_EXE_OUTPUT_DIRECTORY_DEBUG}/${filename} ${CMAKE_CURRENT_BINARY_DIR}/Debug/${filename})
		add_custom_command(
				TARGET PINT_PhysX4 POST_BUILD
				COMMAND ${CMAKE_COMMAND} -E $<IF:$<CONFIG:Debug>,true,copy>
				${PX_EXE_OUTPUT_DIRECTORY_RELEASE}/${filename} ${CMAKE_CURRENT_BINARY_DIR}/Release/${filename})
	endmacro()

	copy_physx_library(PhysX.dll)
	copy_physx_library(PhysXCommon.dll)
	copy_physx_library(PhysXCooking.dll)
	copy_physx_library(PhysXFoundation.dll)
endif ()
