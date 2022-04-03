#
# Used to generate PEEL executable.
#

macro(copy_peel_dependency path filename)
	add_custom_command(
			TARGET PEEL POST_BUILD
			COMMAND ${CMAKE_COMMAND} -E $<IF:$<CONFIG:Debug>,copy,true>
			${PEEL_REPO_ROOT}/${path}/${filename} ${CMAKE_CURRENT_BINARY_DIR}/Debug/${filename})
	add_custom_command(
			TARGET PEEL POST_BUILD
			COMMAND ${CMAKE_COMMAND} -E $<IF:$<CONFIG:Debug>,true,copy>
			${PEEL_REPO_ROOT}/${path}/${filename} ${CMAKE_CURRENT_BINARY_DIR}/Release/${filename})
endmacro()

macro(copy_peel_dependency_variant path filename)
	copy_peel_dependency(${path} ${filename}${PEEL_BIN_ARCH}$<$<CONFIG:Debug>:_D>.dll)
endmacro()

macro(target_link_library_config library)
	target_link_libraries(PEEL
			${library}${PEEL_BIN_ARCH}$<$<CONFIG:Debug>:_D>)
endmacro()

# Source files
set(PEEL_SRC_FILES
    ${PEEL_SOURCE_ROOT}/LegoLib/LegoLib.cpp
    ${PEEL_SOURCE_ROOT}/Loader_Bin.cpp
    ${PEEL_SOURCE_ROOT}/Loader_Obj.cpp
    ${PEEL_SOURCE_ROOT}/Loader_Rays.cpp
    ${PEEL_SOURCE_ROOT}/Loader_RepX.cpp
    ${PEEL_SOURCE_ROOT}/Loader_ShapeProfile.cpp
    ${PEEL_SOURCE_ROOT}/USDExport.cpp
    ${PEEL_SOURCE_ROOT}/ZB2Export.cpp
    ${PEEL_SOURCE_ROOT}/ZB2Import.cpp
    ${PEEL_SOURCE_ROOT}/ZCB/IceZCBBreaker.cpp
    ${PEEL_SOURCE_ROOT}/ZCB/PINT_ZCB.cpp
    ${PEEL_SOURCE_ROOT}/ZCB/PINT_ZCB2.cpp
    ${PEEL_SOURCE_ROOT}/ZCB/PINT_ZCB2_IceChunks.cpp
    ${PEEL_SOURCE_ROOT}/Zcb2_RenderData.cpp
    ${PEEL_SOURCE_ROOT}/GUI_ActorEdit.cpp
    ${PEEL_SOURCE_ROOT}/GUI_ActorSelection.cpp
    ${PEEL_SOURCE_ROOT}/GUI_CompoundEdit.cpp
    ${PEEL_SOURCE_ROOT}/GUI_EditBox.cpp
    ${PEEL_SOURCE_ROOT}/GUI_Helpers.cpp
    ${PEEL_SOURCE_ROOT}/GUI_ImportCollada.cpp
    ${PEEL_SOURCE_ROOT}/GUI_JointEdit.cpp
    ${PEEL_SOURCE_ROOT}/GUI_JointParams.cpp
    ${PEEL_SOURCE_ROOT}/GUI_PosEdit.cpp
    ${PEEL_SOURCE_ROOT}/PintGUIHelper.cpp
    ${PEEL_SOURCE_ROOT}/ProgressBar.cpp
    ${PEEL_SOURCE_ROOT}/RaytracingWindow.cpp
    ${PEEL_SOURCE_ROOT}/TitleData.cpp
    ${PEEL_SOURCE_ROOT}/TitleWindow.cpp
    ${PEEL_SOURCE_ROOT}/Camera.cpp
    ${PEEL_SOURCE_ROOT}/ConvexHull2D.cpp
    ${PEEL_SOURCE_ROOT}/CRC32.cpp
    ${PEEL_SOURCE_ROOT}/Devil.cpp
    ${PEEL_SOURCE_ROOT}/Gamepad.cpp
    ${PEEL_SOURCE_ROOT}/QPCTime.cpp
    ${PEEL_SOURCE_ROOT}/Sound.cpp
    ${PEEL_SOURCE_ROOT}/SupportFile.cpp
    ${PEEL_SOURCE_ROOT}/Capsule.cpp
    ${PEEL_SOURCE_ROOT}/Cylinder.cpp
    ${PEEL_SOURCE_ROOT}/IceBunny.cpp
    ${PEEL_SOURCE_ROOT}/LoopTheLoop.cpp
    ${PEEL_SOURCE_ROOT}/MyConvex.cpp
    ${PEEL_SOURCE_ROOT}/ProceduralTrack.cpp
    ${PEEL_SOURCE_ROOT}/RevolutionShape.cpp
    ${PEEL_SOURCE_ROOT}/Sphere.cpp
    ${PEEL_SOURCE_ROOT}/Terrain.cpp
    ${PEEL_SOURCE_ROOT}/GLConvexRenderer.cpp
    ${PEEL_SOURCE_ROOT}/GLFontRenderer.cpp
    ${PEEL_SOURCE_ROOT}/GLMesh.cpp
    ${PEEL_SOURCE_ROOT}/GLPointRenderer.cpp
    ${PEEL_SOURCE_ROOT}/GLPointRenderer2.cpp
    ${PEEL_SOURCE_ROOT}/GLRenderHelpers.cpp
    ${PEEL_SOURCE_ROOT}/GLScaledCylinder.cpp
    ${PEEL_SOURCE_ROOT}/GLShader.cpp
    ${PEEL_SOURCE_ROOT}/GLTexture.cpp
    ${PEEL_SOURCE_ROOT}/GLVSync.cpp
    ${PEEL_SOURCE_ROOT}/HACD/hacdGraph.cpp
    ${PEEL_SOURCE_ROOT}/HACD/hacdHACD.cpp
    ${PEEL_SOURCE_ROOT}/HACD/hacdICHull.cpp
    ${PEEL_SOURCE_ROOT}/HACD/hacdManifoldMesh.cpp
    ${PEEL_SOURCE_ROOT}/Fracture/Convex.cpp
    ${PEEL_SOURCE_ROOT}/Fracture/Delaunay3d.cpp
    ${PEEL_SOURCE_ROOT}/Fracture/Fracture.cpp
    ${PEEL_SOURCE_ROOT}/Fracture/FracturePattern.cpp
    ${PEEL_SOURCE_ROOT}/Fracture/MultiConvex.cpp
    ${PEEL_SOURCE_ROOT}/Voronoi2D.cpp
    ${PEEL_SOURCE_ROOT}/MinimalRegionManager.cpp
    ${PEEL_SOURCE_ROOT}/Streaming.cpp
    ${PEEL_SOURCE_ROOT}/TerrainRegionManager.cpp
    ${PEEL_SOURCE_ROOT}/TerrainStreamingUI.cpp
    ${PEEL_SOURCE_ROOT}/Scattering.cpp
    ${PEEL_SOURCE_ROOT}/TerrainManager.cpp
    ${PEEL_SOURCE_ROOT}/LZ4/lz4.c
    ${PEEL_SOURCE_ROOT}/LZ4/lz4frame.c
    ${PEEL_SOURCE_ROOT}/LZ4/lz4hc.c
    ${PEEL_SOURCE_ROOT}/LZ4/xxhash.c
    ${PEEL_SOURCE_ROOT}/TestScenes.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_API.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Behavior.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_CCD.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_CCT.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_ContactGeneration.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Cooking.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Cylinders.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Fracture.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Heightfield.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Import.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Kinematics.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Performance.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_StaticScene.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Undefined.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Vehicles.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_VehiclesBase.cpp
    ${PEEL_SOURCE_ROOT}/TestScenesHelpers.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Midphase.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_MidphaseMeshMesh.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Overlap.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Raycast.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Sweep.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Bulldozer_WIP.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Joints_WIP.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Terrain.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Articulations.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_MCArticulations.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_RCArticulations.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_BasicJoints.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_D6.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Joints.cpp
    ${PEEL_SOURCE_ROOT}/TestScenes_Portals.cpp
    ${PEEL_SOURCE_ROOT}/FrameBufferObject.cpp
    ${PEEL_SOURCE_ROOT}/PintRender.cpp
    ${PEEL_SOURCE_ROOT}/PintRenderState.cpp
    ${PEEL_SOURCE_ROOT}/RenderTarget.cpp
    ${PEEL_SOURCE_ROOT}/ShadowMap.cpp
    ${PEEL_SOURCE_ROOT}/PintBatchConvexShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintColorShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintConvexInstanceShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintGLMeshShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintPointSpriteSphereShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintTerrainTileRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintDLBoxShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintDLCapsuleShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintDLConvexShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintDLCylinderShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintDLMeshShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintDLShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/PintDLSphereShapeRenderer.cpp
    ${PEEL_SOURCE_ROOT}/RenderModel.cpp
    ${PEEL_SOURCE_ROOT}/RenderModelFFP.cpp
    ${PEEL_SOURCE_ROOT}/Shader.cpp
    ${PEEL_SOURCE_ROOT}/MatcapShader.cpp
    ${PEEL_SOURCE_ROOT}/RenderModelMatcap.cpp
    ${PEEL_SOURCE_ROOT}/RenderModelSimpleShader.cpp
    ${PEEL_SOURCE_ROOT}/SimpleShader.cpp
    ${PEEL_SOURCE_ROOT}/FlatShader.cpp
    ${PEEL_SOURCE_ROOT}/RenderModelSimpleShadows.cpp
    ${PEEL_SOURCE_ROOT}/ShadowShader.cpp
    ${PEEL_SOURCE_ROOT}/CameraManager.cpp
    ${PEEL_SOURCE_ROOT}/Common.cpp
    ${PEEL_SOURCE_ROOT}/ControlInterface.cpp
    ${PEEL_SOURCE_ROOT}/CustomICEAllocator.cpp
    ${PEEL_SOURCE_ROOT}/DefaultControlInterface.cpp
    ${PEEL_SOURCE_ROOT}/DefaultEnv.cpp
    ${PEEL_SOURCE_ROOT}/DisplayTexture.cpp
    ${PEEL_SOURCE_ROOT}/Foundation.cpp
    ${PEEL_SOURCE_ROOT}/Grid.cpp
    ${PEEL_SOURCE_ROOT}/PEEL.cpp
    ${PEEL_SOURCE_ROOT}/PEEL_MenuBar.cpp
    ${PEEL_SOURCE_ROOT}/PEEL_Threads.cpp
    ${PEEL_SOURCE_ROOT}/PhysicsData.cpp
    ${PEEL_SOURCE_ROOT}/Pint.cpp
    ${PEEL_SOURCE_ROOT}/PintEngineData.cpp
    ${PEEL_SOURCE_ROOT}/PintObjectsManager.cpp
    ${PEEL_SOURCE_ROOT}/PintSelectionManager.cpp
    ${PEEL_SOURCE_ROOT}/PintSQ.cpp
    ${PEEL_SOURCE_ROOT}/PintTiming.cpp
    ${PEEL_SOURCE_ROOT}/PintVisibilityManager.cpp
    ${PEEL_SOURCE_ROOT}/Plugins.cpp
    ${PEEL_SOURCE_ROOT}/RepX_Tools.cpp
    ${PEEL_SOURCE_ROOT}/RoundCorners.cpp
    ${PEEL_SOURCE_ROOT}/Script.cpp
    ${PEEL_SOURCE_ROOT}/Simulate.cpp
    ${PEEL_SOURCE_ROOT}/Starter.cpp
    ${PEEL_SOURCE_ROOT}/stdafx.cpp
    ${PEEL_SOURCE_ROOT}/SurfaceManager.cpp
    ${PEEL_SOURCE_ROOT}/TestSelector.cpp
    ${PEEL_SOURCE_ROOT}/TextureManager.cpp
    ${PEEL_SOURCE_ROOT}/TrashCache.cpp
    ${PEEL_SOURCE_ROOT}/Tool.cpp
    ${PEEL_SOURCE_ROOT}/ToolAddImpulse.cpp
    ${PEEL_SOURCE_ROOT}/ToolBullet.cpp
    ${PEEL_SOURCE_ROOT}/ToolCreateJoint.cpp
    ${PEEL_SOURCE_ROOT}/ToolCreateRope.cpp
    ${PEEL_SOURCE_ROOT}/ToolObjectCreate.cpp
    ${PEEL_SOURCE_ROOT}/ToolPicking.cpp
    ${PEEL_SOURCE_ROOT}/ToolRayBased.cpp
    ${PEEL_SOURCE_ROOT}/ToolShootObject.cpp
    ${PEEL_SOURCE_ROOT}/ToolTerrainEditor.cpp
    ${PEEL_SOURCE_ROOT}/ToolTexture.cpp
    ${PEEL_SOURCE_ROOT}/ToolRotate.cpp
    ${PEEL_SOURCE_ROOT}/ToolTransform.cpp
    ${PEEL_SOURCE_ROOT}/ToolTranslate.cpp
    ${PEEL_SOURCE_ROOT}/PINT_Editor.cpp
    ${PEEL_SOURCE_ROOT}/ScreenQuad.cpp
    ${PEEL_SOURCE_ROOT}/ScreenQuad_BackColor.cpp
    ${PEEL_SOURCE_ROOT}/ScreenQuad_ColorGradient.cpp
    ${PEEL_SOURCE_ROOT}/ScreenQuad_ColorSphere.cpp
    ${PEEL_SOURCE_ROOT}/RaytracingTest.cpp
    ${PEEL_SOURCE_ROOT}/GLRenderStates.cpp
    ${PEEL_SOURCE_ROOT}/MeshCleaner.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/PsFoundation.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/PsAllocator.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/PsAssert.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/PsMathUtils.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/PsString.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/PsTempAllocator.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/PsUtilities.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsAtomic.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsCpu.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsFPU.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsMutex.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsPrintString.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsSList.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsSocket.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsSync.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsThread.cpp
    ${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsTime.cpp
    ${PEEL_SOURCE_ROOT}/LegoLib/LegoLib.h
    ${PEEL_SOURCE_ROOT}/Loader_Bin.h
    ${PEEL_SOURCE_ROOT}/Loader_Obj.h
    ${PEEL_SOURCE_ROOT}/Loader_Rays.h
    ${PEEL_SOURCE_ROOT}/Loader_RepX.h
    ${PEEL_SOURCE_ROOT}/Loader_ShapeProfile.h
    ${PEEL_SOURCE_ROOT}/USDExport.h
    ${PEEL_SOURCE_ROOT}/ZB2Export.h
    ${PEEL_SOURCE_ROOT}/ZB2Import.h
    ${PEEL_SOURCE_ROOT}/ZCB/IceZCBBreaker.h
    ${PEEL_SOURCE_ROOT}/ZCB/IceZCBFormat.h
    ${PEEL_SOURCE_ROOT}/ZCB/PINT_ZCB.h
    ${PEEL_SOURCE_ROOT}/ZCB/PINT_ZCB2.h
    ${PEEL_SOURCE_ROOT}/Zcb2_RenderData.h
    ${PEEL_SOURCE_ROOT}/GUI_ActorEdit.h
    ${PEEL_SOURCE_ROOT}/GUI_ActorSelection.h
    ${PEEL_SOURCE_ROOT}/GUI_CompoundEdit.h
    ${PEEL_SOURCE_ROOT}/GUI_EditBox.h
    ${PEEL_SOURCE_ROOT}/GUI_Helpers.h
    ${PEEL_SOURCE_ROOT}/GUI_ImportCollada.h
    ${PEEL_SOURCE_ROOT}/GUI_JointEdit.h
    ${PEEL_SOURCE_ROOT}/GUI_JointParams.h
    ${PEEL_SOURCE_ROOT}/GUI_PosEdit.h
    ${PEEL_SOURCE_ROOT}/GUI_RenderInterface.h
    ${PEEL_SOURCE_ROOT}/PintGUIHelper.h
    ${PEEL_SOURCE_ROOT}/ProgressBar.h
    ${PEEL_SOURCE_ROOT}/RaytracingWindow.h
    ${PEEL_SOURCE_ROOT}/TitleWindow.h
    ${PEEL_SOURCE_ROOT}/Camera.h
    ${PEEL_SOURCE_ROOT}/CRC32.h
    ${PEEL_SOURCE_ROOT}/Devil.h
    ${PEEL_SOURCE_ROOT}/Gamepad.h
    ${PEEL_SOURCE_ROOT}/QPCTime.h
    ${PEEL_SOURCE_ROOT}/Sound.h
    ${PEEL_SOURCE_ROOT}/SupportFile.h
    ${PEEL_SOURCE_ROOT}/Capsule.h
    ${PEEL_SOURCE_ROOT}/Cylinder.h
    ${PEEL_SOURCE_ROOT}/IceBunny.h
    ${PEEL_SOURCE_ROOT}/LoopTheLoop.h
    ${PEEL_SOURCE_ROOT}/MyConvex.h
    ${PEEL_SOURCE_ROOT}/ProceduralTrack.h
    ${PEEL_SOURCE_ROOT}/RevolutionShape.h
    ${PEEL_SOURCE_ROOT}/Sphere.h
    ${PEEL_SOURCE_ROOT}/Terrain.h
    ${PEEL_SOURCE_ROOT}/GLConvexRenderer.h
    ${PEEL_SOURCE_ROOT}/GLFontData.h
    ${PEEL_SOURCE_ROOT}/GLFontRenderer.h
    ${PEEL_SOURCE_ROOT}/GLMesh.h
    ${PEEL_SOURCE_ROOT}/GLPointRenderer.h
    ${PEEL_SOURCE_ROOT}/GLPointRenderer2.h
    ${PEEL_SOURCE_ROOT}/GLRenderHelpers.h
    ${PEEL_SOURCE_ROOT}/GLScaledCylinder.h
    ${PEEL_SOURCE_ROOT}/GLShader.h
    ${PEEL_SOURCE_ROOT}/GLTexture.h
    ${PEEL_SOURCE_ROOT}/GLVSync.h
    ${PEEL_SOURCE_ROOT}/HACD/hacdCircularList.h
    ${PEEL_SOURCE_ROOT}/HACD/hacdGraph.h
    ${PEEL_SOURCE_ROOT}/HACD/hacdHACD.h
    ${PEEL_SOURCE_ROOT}/HACD/hacdICHull.h
    ${PEEL_SOURCE_ROOT}/HACD/hacdManifoldMesh.h
    ${PEEL_SOURCE_ROOT}/HACD/hacdVector.h
    ${PEEL_SOURCE_ROOT}/HACD/hacdVersion.h
    ${PEEL_SOURCE_ROOT}/Fracture/Fracture.h
    ${PEEL_SOURCE_ROOT}/Fracture/MultiConvex.h
    ${PEEL_SOURCE_ROOT}/Voronoi2D.h
    ${PEEL_SOURCE_ROOT}/MinimalRegionManager.h
    ${PEEL_SOURCE_ROOT}/Streaming.h
    ${PEEL_SOURCE_ROOT}/TerrainRegionManager.h
    ${PEEL_SOURCE_ROOT}/TerrainStreamingUI.h
    ${PEEL_SOURCE_ROOT}/Scattering.h
    ${PEEL_SOURCE_ROOT}/TerrainManager.h
    ${PEEL_SOURCE_ROOT}/LZ4/lz4.h
    ${PEEL_SOURCE_ROOT}/LZ4/lz4frame.h
    ${PEEL_SOURCE_ROOT}/LZ4/lz4frame_static.h
    ${PEEL_SOURCE_ROOT}/LZ4/lz4hc.h
    ${PEEL_SOURCE_ROOT}/LZ4/xxhash.h
    ${PEEL_SOURCE_ROOT}/TestScenes.h
    ${PEEL_SOURCE_ROOT}/TestScenes_Heightfield.h
    ${PEEL_SOURCE_ROOT}/TestScenes_VehiclesBase.h
    ${PEEL_SOURCE_ROOT}/TestScenesHelpers.h
    ${PEEL_SOURCE_ROOT}/FrameBufferObject.h
    ${PEEL_SOURCE_ROOT}/PintRender.h
    ${PEEL_SOURCE_ROOT}/PintRenderPass.h
    ${PEEL_SOURCE_ROOT}/PintRenderState.h
    ${PEEL_SOURCE_ROOT}/RenderTarget.h
    ${PEEL_SOURCE_ROOT}/ShadowMap.h
    ${PEEL_SOURCE_ROOT}/PintBatchConvexShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintColorShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintConvexInstanceShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintGLMeshShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintNullRenderer.h
    ${PEEL_SOURCE_ROOT}/PintPointSpriteSphereShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintTerrainTileRenderer.h
    ${PEEL_SOURCE_ROOT}/PintDLBoxShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintDLCapsuleShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintDLConvexShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintDLCylinderShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintDLMeshShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintDLShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/PintDLSphereShapeRenderer.h
    ${PEEL_SOURCE_ROOT}/RenderModel.h
    ${PEEL_SOURCE_ROOT}/RenderModelFFP.h
    ${PEEL_SOURCE_ROOT}/Shader.h
    ${PEEL_SOURCE_ROOT}/MatcapShader.h
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/RenderModel_Mapcap_ps.h"
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/RenderModel_Mapcap_vs.h"
    ${PEEL_SOURCE_ROOT}/RenderModelMatcap.h
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/RenderModel_SimpleShader1_ps.h"
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/RenderModel_SimpleShader1_vs.h"
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/RenderModel_SimpleShader2_ps.h"
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/RenderModel_SimpleShader2_vs.h"
    ${PEEL_SOURCE_ROOT}/RenderModelSimpleShader.h
    ${PEEL_SOURCE_ROOT}/SimpleShader.h
    ${PEEL_SOURCE_ROOT}/FlatShader.h
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/RenderModel_SimpleShadows_ps.h"
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/RenderModel_SimpleShadows_vs.h"
    ${PEEL_SOURCE_ROOT}/RenderModelSimpleShadows.h
    ${PEEL_SOURCE_ROOT}/ShadowShader.h
    ${PEEL_SOURCE_ROOT}/CameraManager.h
    ${PEEL_SOURCE_ROOT}/Common.h
    ${PEEL_SOURCE_ROOT}/ControlInterface.h
    ${PEEL_SOURCE_ROOT}/CustomICEAllocator.h
    ${PEEL_SOURCE_ROOT}/DefaultControlInterface.h
    ${PEEL_SOURCE_ROOT}/DefaultEnv.h
    ${PEEL_SOURCE_ROOT}/DisplayTexture.h
    ${PEEL_SOURCE_ROOT}/Grid.h
    ${PEEL_SOURCE_ROOT}/PEEL.h
    ${PEEL_SOURCE_ROOT}/PEEL_MenuBar.h
    ${PEEL_SOURCE_ROOT}/PEEL_Settings.h
    ${PEEL_SOURCE_ROOT}/PEEL_Threads.h
    ${PEEL_SOURCE_ROOT}/PhysicsData.h
    ${PEEL_SOURCE_ROOT}/Pint.h
    ${PEEL_SOURCE_ROOT}/PintDef.h
    ${PEEL_SOURCE_ROOT}/PintEngineData.h
    ${PEEL_SOURCE_ROOT}/PintObjectsManager.h
    ${PEEL_SOURCE_ROOT}/PintSelectionManager.h
    ${PEEL_SOURCE_ROOT}/PintSQ.h
    ${PEEL_SOURCE_ROOT}/PintSurfaceInterface.h
    ${PEEL_SOURCE_ROOT}/PintTiming.h
    ${PEEL_SOURCE_ROOT}/PintVisibilityManager.h
    ${PEEL_SOURCE_ROOT}/Plugins.h
    ${PEEL_SOURCE_ROOT}/Profiling.h
    ${PEEL_SOURCE_ROOT}/RepX_Tools.h
    ${PEEL_SOURCE_ROOT}/RoundCorners.h
    ${PEEL_SOURCE_ROOT}/Script.h
    ${PEEL_SOURCE_ROOT}/SourceRay.h
    ${PEEL_SOURCE_ROOT}/stdafx.h
    ${PEEL_SOURCE_ROOT}/SurfaceManager.h
    ${PEEL_SOURCE_ROOT}/targetver.h
    ${PEEL_SOURCE_ROOT}/TestSelector.h
    ${PEEL_SOURCE_ROOT}/TextureManager.h
    ${PEEL_SOURCE_ROOT}/TrashCache.h
    ${PEEL_SOURCE_ROOT}/Tool.h
    ${PEEL_SOURCE_ROOT}/ToolAddImpulse.h
    ${PEEL_SOURCE_ROOT}/ToolBullet.h
    ${PEEL_SOURCE_ROOT}/ToolCreateJoint.h
    ${PEEL_SOURCE_ROOT}/ToolCreateRope.h
    ${PEEL_SOURCE_ROOT}/ToolInterface.h
    ${PEEL_SOURCE_ROOT}/ToolObjectCreate.h
    ${PEEL_SOURCE_ROOT}/ToolPicking.h
    ${PEEL_SOURCE_ROOT}/ToolRayBased.h
    ${PEEL_SOURCE_ROOT}/ToolShootObject.h
    ${PEEL_SOURCE_ROOT}/ToolTerrainEditor.h
    ${PEEL_SOURCE_ROOT}/ToolTexture.h
    ${PEEL_SOURCE_ROOT}/ToolRotate.h
    ${PEEL_SOURCE_ROOT}/ToolTransform.h
    ${PEEL_SOURCE_ROOT}/ToolTranslate.h
    ${PEEL_SOURCE_ROOT}/PINT_Editor.h
    ${PEEL_SOURCE_ROOT}/ScreenQuad.h
    ${PEEL_SOURCE_ROOT}/ScreenQuad_BackColor.h
    ${PEEL_SOURCE_ROOT}/ScreenQuad_ColorGradient.h
    ${PEEL_SOURCE_ROOT}/ScreenQuad_ColorSphere.h
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/ScreenQuad_ColorSphere2_ps.h"
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/ScreenQuad_ColorSphere_ps.h"
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/ScreenQuad_ColorSphere_vs.h"
    "${PEEL_SOURCE_ROOT}/../Media/#Shaders/ScreenQuad_Default_vs.h"
    ${PEEL_SOURCE_ROOT}/RaytracingTest.h
    ${PEEL_SOURCE_ROOT}/resource.h
    ${PEEL_SOURCE_ROOT}/GLRenderStates.h
    ${PEEL_SOURCE_ROOT}/MeshCleaner.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/windows/PxWindowsIntrinsics.h
    ${PEEL_SOURCE_ROOT}/ICE_To_PX.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/Ps.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsAlignedMalloc.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsAlloca.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsAllocator.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsAoS.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsArray.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsAtomic.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsBasicTemplates.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsBitUtils.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsBroadcast.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsCpu.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsFoundation.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsFPU.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsHash.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsHashInternals.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsHashMap.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsHashSet.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsInlineAllocator.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsInlineAoS.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsInlineArray.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsIntrinsics.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsMathUtils.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsMutex.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsPool.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsSList.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsSocket.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsSort.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsSortInternals.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsString.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsSync.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsTempAllocator.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsThread.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsTime.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsUserAllocated.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsUtilities.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsVecMath.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsVecMathAoSScalar.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsVecMathAoSScalarInline.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsVecMathSSE.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsVecMathUtilities.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsVecQuat.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/PsVecTransform.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/windows/PsWindowsAoS.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/windows/PsWindowsFPU.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/windows/PsWindowsInclude.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/windows/PsWindowsInlineAoS.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/windows/PsWindowsIntrinsics.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/include/windows/PsWindowsTrigConstants.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/Px.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxAllocatorCallback.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxAssert.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxBitAndData.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxBounds3.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxErrorCallback.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxErrors.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxFlags.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxFoundation.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxFoundationConfig.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxIntrinsics.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxIO.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxMat33.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxMat44.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxMath.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxMathUtils.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxMemory.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxPhysicsVersion.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxPlane.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxPreprocessor.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxProfiler.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxQuat.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxSharedAssert.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxSimpleTypes.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxStrideIterator.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxTransform.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxUnionCast.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxVec2.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxVec3.h
    ${PEEL_SOURCE_ROOT}/PxFoundation/PxVec4.h
    ${PEEL_SOURCE_ROOT}/HACD/hacdCircularList.inl
    ${PEEL_SOURCE_ROOT}/HACD/hacdVector.inl
    # IMAGE ${PEEL_SOURCE_ROOT}/PEEL.ico
    ${PEEL_SOURCE_ROOT}/Fracture/Convex.h
    ${PEEL_SOURCE_ROOT}/Fracture/Delaunay3d.h
    ${PEEL_SOURCE_ROOT}/Fracture/FracturePattern.h
)

set(APP_ICON_RESOURCE_WINDOWS "${PEEL_SOURCE_ROOT}/PEEL.rc")

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
	# Enable Precompiled Headers for PEEL
	set_source_files_properties(${PEEL_SRC_FILES} PROPERTIES COMPILE_FLAGS "/Yustdafx.h")
	set(PEEL_SRC_FILES ${PEEL_SRC_FILES} ${PEEL_SOURCE_ROOT}/stdafx.cpp)
	set_source_files_properties(${PEEL_SOURCE_ROOT}/stdafx.cpp PROPERTIES COMPILE_FLAGS "/Ycstdafx.h")
endif()

set_source_files_properties(
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsFPU.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsMutex.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsPrintString.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsSocket.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsSList.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsThread.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsSync.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsTime.cpp"
		"${PEEL_SOURCE_ROOT}/HACD/hacdGraph.cpp"
		"${PEEL_SOURCE_ROOT}/HACD/hacdICHull.cpp"
		"${PEEL_SOURCE_ROOT}/HACD/hacdHACD.cpp"
		"${PEEL_SOURCE_ROOT}/HACD/hacdManifoldMesh.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/PsFoundation.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/PsAllocator.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/PsAssert.cp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/PsString.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/PsMathUtils.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/PsUtilities.cp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsAtomic.cp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsCpu.cp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/PsTempAllocator.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/PsAssert.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/PsUtilities.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsAtomic.cpp"
		"${PEEL_SOURCE_ROOT}/PxFoundation/src/windows/PsWindowsCpu.cpp"
		PROPERTIES SKIP_PRECOMPILE_HEADERS ON)

set_source_files_properties(
		"${PEEL_SOURCE_ROOT}/LZ4/lz4.c"
		"${PEEL_SOURCE_ROOT}/LZ4/lz4frame.c"
		"${PEEL_SOURCE_ROOT}/LZ4/lz4hc.c"
		"${PEEL_SOURCE_ROOT}/LZ4/xxhash.c"
		PROPERTIES 	LANGUAGE CXX
					SKIP_PRECOMPILE_HEADERS ON)

# Group source files
source_group(TREE ${PEEL_REPO_ROOT} FILES ${PEEL_SRC_FILES})

# Create PEEL lib
add_executable(PEEL
		${PEEL_SRC_FILES}
		${APP_ICON_RESOURCE_WINDOWS})

# Set the correct working directory
set_property(TARGET PEEL PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${PEEL_SOURCE_ROOT}")
set_property(TARGET PEEL PROPERTY CXX_STANDARD 17)

set_target_properties(PEEL PROPERTIES
		DEBUG_POSTFIX _DEBUG)

target_link_options(PEEL
		PRIVATE /SUBSYSTEM:CONSOLE /NODEFAULTLIB:LIBCMT)

target_compile_definitions(PEEL PRIVATE
		_CONSOLE
		GLUT_NO_LIB_PRAGMA
		PX_PHYSX_STATIC_LIB)

target_include_directories(PEEL SYSTEM BEFORE
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
		PUBLIC ${PEEL_REPO_ROOT}/Externals/DevIL/include
		PUBLIC ${PEEL_REPO_ROOT}/Private/NVD)

target_link_directories(PEEL
		PUBLIC "${PEEL_SOURCE_ROOT}/Ice/Lib${PEEL_BIN_ARCH}"
		PUBLIC "${PEEL_SOURCE_ROOT}/GL"
		PUBLIC "${PEEL_SOURCE_ROOT}/GlutX/Lib"
		PUBLIC "${PEEL_REPO_ROOT}/Externals")

target_link_libraries(PEEL
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
target_link_library_config(ZCB2)
target_link_library_config(GlutX)

copy_peel_dependency(Externals/Binaries/${PEEL_BIN_DIR_NAME} DevIL.dll)
copy_peel_dependency(Externals/Binaries/${PEEL_BIN_DIR_NAME} fmod${PEEL_BIN_ARCH}.dll)
copy_peel_dependency(Externals/Binaries/${PEEL_BIN_DIR_NAME} Microsoft.VC90.DebugCRT.manifest)
copy_peel_dependency(Externals/Binaries/${PEEL_BIN_DIR_NAME} msvcm90d.dll)
copy_peel_dependency(Externals/Binaries/${PEEL_BIN_DIR_NAME} msvcp90.dll)
copy_peel_dependency(Externals/Binaries/${PEEL_BIN_DIR_NAME} msvcp90d.dll)
copy_peel_dependency(Externals/Binaries/${PEEL_BIN_DIR_NAME} msvcr90.dll)
copy_peel_dependency(Externals/Binaries/${PEEL_BIN_DIR_NAME} msvcr90d.dll)

copy_peel_dependency(Src/GL glut32.dll)
copy_peel_dependency(Src/GL glew32.dll)
copy_peel_dependency(Src/GL glew64.dll)

copy_peel_dependency_variant(Src/GlutX/Bin GlutX)

copy_peel_dependency_variant(Src/Ice/Bin/${PEEL_BIN_DIR_NAME} Contact)
copy_peel_dependency_variant(Src/Ice/Bin/${PEEL_BIN_DIR_NAME} IceCharacter)
copy_peel_dependency_variant(Src/Ice/Bin/${PEEL_BIN_DIR_NAME} IceCore)
copy_peel_dependency_variant(Src/Ice/Bin/${PEEL_BIN_DIR_NAME} IceGUI)
copy_peel_dependency_variant(Src/Ice/Bin/${PEEL_BIN_DIR_NAME} IceImageWork)
copy_peel_dependency_variant(Src/Ice/Bin/${PEEL_BIN_DIR_NAME} IceMaths)
copy_peel_dependency_variant(Src/Ice/Bin/${PEEL_BIN_DIR_NAME} IceRenderer)
copy_peel_dependency_variant(Src/Ice/Bin/${PEEL_BIN_DIR_NAME} IceTerrain)
copy_peel_dependency_variant(Src/Ice/Bin/${PEEL_BIN_DIR_NAME} Meshmerizer)
