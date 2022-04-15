#
# Used to generate PEEL executable.
#

macro(copy_peel_dependency path filename)
	add_custom_command(
			TARGET PEEL POST_BUILD
			COMMAND ${CMAKE_COMMAND} -E $<IF:$<CONFIG:Debug>,copy_if_different,true>
			${PEEL_REPO_ROOT}/${path}/${filename} ${CMAKE_CURRENT_BINARY_DIR}/Debug/${filename})
	add_custom_command(
			TARGET PEEL POST_BUILD
			COMMAND ${CMAKE_COMMAND} -E $<IF:$<CONFIG:Debug>,true,copy_if_different>
			${PEEL_REPO_ROOT}/${path}/${filename} ${CMAKE_CURRENT_BINARY_DIR}/Release/${filename})
endmacro()

macro(copy_peel_dependency_variant path filename)
	copy_peel_dependency(${path} ${filename}${PEEL_SYSTEM_BIN_POSTFIX}$<$<CONFIG:Debug>:_D>.dll)
endmacro()

macro(target_link_library_config library)
	target_link_libraries(PEEL
			${library}${PEEL_SYSTEM_BIN_POSTFIX}$<$<CONFIG:Debug>:_D>)
endmacro()

# Source files
set(PEEL_SRC_FILES
		${PEEL_APPLICATION_ROOT}/LegoLib/LegoLib.cpp
		${PEEL_APPLICATION_ROOT}/Loader_Bin.cpp
		${PEEL_APPLICATION_ROOT}/Loader_Obj.cpp
		${PEEL_APPLICATION_ROOT}/Loader_Rays.cpp
		${PEEL_APPLICATION_ROOT}/Loader_RepX.cpp
		${PEEL_APPLICATION_ROOT}/Loader_ShapeProfile.cpp
		${PEEL_APPLICATION_ROOT}/USDExport.cpp
		${PEEL_APPLICATION_ROOT}/ZB2Export.cpp
		${PEEL_APPLICATION_ROOT}/ZB2Import.cpp
		${PEEL_APPLICATION_ROOT}/ZCB/IceZCBBreaker.cpp
		${PEEL_APPLICATION_ROOT}/ZCB/PINT_ZCB.cpp
		${PEEL_APPLICATION_ROOT}/ZCB/PINT_ZCB2.cpp
		${PEEL_APPLICATION_ROOT}/ZCB/PINT_ZCB2_IceChunks.cpp
		${PEEL_APPLICATION_ROOT}/Zcb2_RenderData.cpp
		${PEEL_APPLICATION_ROOT}/GUI_ActorEdit.cpp
		${PEEL_APPLICATION_ROOT}/GUI_ActorSelection.cpp
		${PEEL_APPLICATION_ROOT}/GUI_CompoundEdit.cpp
		${PEEL_APPLICATION_ROOT}/GUI_EditBox.cpp
		${PEEL_APPLICATION_ROOT}/GUI_Helpers.cpp
		${PEEL_APPLICATION_ROOT}/GUI_ImportCollada.cpp
		${PEEL_APPLICATION_ROOT}/GUI_JointEdit.cpp
		${PEEL_APPLICATION_ROOT}/GUI_JointParams.cpp
		${PEEL_APPLICATION_ROOT}/GUI_PosEdit.cpp
		${PEEL_APPLICATION_ROOT}/PintGUIHelper.cpp
		${PEEL_APPLICATION_ROOT}/ProgressBar.cpp
		${PEEL_APPLICATION_ROOT}/RaytracingWindow.cpp
		${PEEL_APPLICATION_ROOT}/TitleData.cpp
		${PEEL_APPLICATION_ROOT}/TitleWindow.cpp
		${PEEL_APPLICATION_ROOT}/Camera.cpp
		${PEEL_APPLICATION_ROOT}/ConvexHull2D.cpp
		${PEEL_APPLICATION_ROOT}/CRC32.cpp
		${PEEL_APPLICATION_ROOT}/Devil.cpp
		${PEEL_APPLICATION_ROOT}/Gamepad.cpp
		${PEEL_APPLICATION_ROOT}/QPCTime.cpp
		${PEEL_APPLICATION_ROOT}/Sound.cpp
		${PEEL_APPLICATION_ROOT}/SupportFile.cpp
		${PEEL_APPLICATION_ROOT}/Capsule.cpp
		${PEEL_APPLICATION_ROOT}/Cylinder.cpp
		${PEEL_APPLICATION_ROOT}/IceBunny.cpp
		${PEEL_APPLICATION_ROOT}/LoopTheLoop.cpp
		${PEEL_APPLICATION_ROOT}/MyConvex.cpp
		${PEEL_APPLICATION_ROOT}/ProceduralTrack.cpp
		${PEEL_APPLICATION_ROOT}/RevolutionShape.cpp
		${PEEL_APPLICATION_ROOT}/Sphere.cpp
		${PEEL_APPLICATION_ROOT}/Terrain.cpp
		${PEEL_APPLICATION_ROOT}/GLConvexRenderer.cpp
		${PEEL_APPLICATION_ROOT}/GLFontRenderer.cpp
		${PEEL_APPLICATION_ROOT}/GLMesh.cpp
		${PEEL_APPLICATION_ROOT}/GLPointRenderer.cpp
		${PEEL_APPLICATION_ROOT}/GLPointRenderer2.cpp
		${PEEL_APPLICATION_ROOT}/GLRenderHelpers.cpp
		${PEEL_APPLICATION_ROOT}/GLScaledCylinder.cpp
		${PEEL_APPLICATION_ROOT}/GLShader.cpp
		${PEEL_APPLICATION_ROOT}/GLTexture.cpp
		${PEEL_APPLICATION_ROOT}/GLVSync.cpp
		${PEEL_APPLICATION_ROOT}/HACD/hacdGraph.cpp
		${PEEL_APPLICATION_ROOT}/HACD/hacdHACD.cpp
		${PEEL_APPLICATION_ROOT}/HACD/hacdICHull.cpp
		${PEEL_APPLICATION_ROOT}/HACD/hacdManifoldMesh.cpp
		${PEEL_APPLICATION_ROOT}/Fracture/Convex.cpp
		${PEEL_APPLICATION_ROOT}/Fracture/Delaunay3d.cpp
		${PEEL_APPLICATION_ROOT}/Fracture/Fracture.cpp
		${PEEL_APPLICATION_ROOT}/Fracture/FracturePattern.cpp
		${PEEL_APPLICATION_ROOT}/Fracture/MultiConvex.cpp
		${PEEL_APPLICATION_ROOT}/Voronoi2D.cpp
		${PEEL_APPLICATION_ROOT}/MinimalRegionManager.cpp
		${PEEL_APPLICATION_ROOT}/Streaming.cpp
		${PEEL_APPLICATION_ROOT}/TerrainRegionManager.cpp
		${PEEL_APPLICATION_ROOT}/TerrainStreamingUI.cpp
		${PEEL_APPLICATION_ROOT}/Scattering.cpp
		${PEEL_APPLICATION_ROOT}/TerrainManager.cpp
		${PEEL_APPLICATION_ROOT}/LZ4/lz4.c
		${PEEL_APPLICATION_ROOT}/LZ4/lz4frame.c
		${PEEL_APPLICATION_ROOT}/LZ4/lz4hc.c
		${PEEL_APPLICATION_ROOT}/LZ4/xxhash.c
		${PEEL_APPLICATION_ROOT}/TestScenes.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_API.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Behavior.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_CCD.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_CCT.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_ContactGeneration.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Cooking.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Cylinders.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Fracture.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Heightfield.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Import.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Kinematics.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Performance.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_StaticScene.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Undefined.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Vehicles.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_VehiclesBase.cpp
		${PEEL_APPLICATION_ROOT}/TestScenesHelpers.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Midphase.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_MidphaseMeshMesh.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Overlap.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Raycast.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Sweep.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Bulldozer_WIP.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Joints_WIP.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Terrain.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Articulations.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_MCArticulations.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_RCArticulations.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_BasicJoints.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_D6.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Joints.cpp
		${PEEL_APPLICATION_ROOT}/TestScenes_Portals.cpp
		${PEEL_APPLICATION_ROOT}/FrameBufferObject.cpp
		${PEEL_APPLICATION_ROOT}/PintRender.cpp
		${PEEL_APPLICATION_ROOT}/PintRenderState.cpp
		${PEEL_APPLICATION_ROOT}/RenderTarget.cpp
		${PEEL_APPLICATION_ROOT}/ShadowMap.cpp
		${PEEL_APPLICATION_ROOT}/PintBatchConvexShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintColorShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintConvexInstanceShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintGLMeshShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintPointSpriteSphereShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintTerrainTileRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintDLBoxShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintDLCapsuleShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintDLConvexShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintDLCylinderShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintDLMeshShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintDLShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/PintDLSphereShapeRenderer.cpp
		${PEEL_APPLICATION_ROOT}/RenderModel.cpp
		${PEEL_APPLICATION_ROOT}/RenderModelFFP.cpp
		${PEEL_APPLICATION_ROOT}/Shader.cpp
		${PEEL_APPLICATION_ROOT}/MatcapShader.cpp
		${PEEL_APPLICATION_ROOT}/RenderModelMatcap.cpp
		${PEEL_APPLICATION_ROOT}/RenderModelSimpleShader.cpp
		${PEEL_APPLICATION_ROOT}/SimpleShader.cpp
		${PEEL_APPLICATION_ROOT}/FlatShader.cpp
		${PEEL_APPLICATION_ROOT}/RenderModelSimpleShadows.cpp
		${PEEL_APPLICATION_ROOT}/ShadowShader.cpp
		${PEEL_APPLICATION_ROOT}/CameraManager.cpp
		${PEEL_APPLICATION_ROOT}/Common.cpp
		${PEEL_APPLICATION_ROOT}/ControlInterface.cpp
		${PEEL_APPLICATION_ROOT}/CustomICEAllocator.cpp
		${PEEL_APPLICATION_ROOT}/DefaultControlInterface.cpp
		${PEEL_APPLICATION_ROOT}/DefaultEnv.cpp
		${PEEL_APPLICATION_ROOT}/DisplayTexture.cpp
		${PEEL_APPLICATION_ROOT}/Foundation.cpp
		${PEEL_APPLICATION_ROOT}/Grid.cpp
		${PEEL_APPLICATION_ROOT}/PEEL.cpp
		${PEEL_APPLICATION_ROOT}/PEEL_MenuBar.cpp
		${PEEL_APPLICATION_ROOT}/PEEL_Threads.cpp
		${PEEL_APPLICATION_ROOT}/PhysicsData.cpp
		${PEEL_APPLICATION_ROOT}/Pint.cpp
		${PEEL_APPLICATION_ROOT}/PintEngineData.cpp
		${PEEL_APPLICATION_ROOT}/PintObjectsManager.cpp
		${PEEL_APPLICATION_ROOT}/PintSelectionManager.cpp
		${PEEL_APPLICATION_ROOT}/PintSQ.cpp
		${PEEL_APPLICATION_ROOT}/PintTiming.cpp
		${PEEL_APPLICATION_ROOT}/PintVisibilityManager.cpp
		${PEEL_APPLICATION_ROOT}/Plugins.cpp
		${PEEL_APPLICATION_ROOT}/RepX_Tools.cpp
		${PEEL_APPLICATION_ROOT}/RoundCorners.cpp
		${PEEL_APPLICATION_ROOT}/Script.cpp
		${PEEL_APPLICATION_ROOT}/Simulate.cpp
		${PEEL_APPLICATION_ROOT}/Starter.cpp
		${PEEL_APPLICATION_ROOT}/stdafx.cpp
		${PEEL_APPLICATION_ROOT}/SurfaceManager.cpp
		${PEEL_APPLICATION_ROOT}/TestSelector.cpp
		${PEEL_APPLICATION_ROOT}/TextureManager.cpp
		${PEEL_APPLICATION_ROOT}/TrashCache.cpp
		${PEEL_APPLICATION_ROOT}/Tool.cpp
		${PEEL_APPLICATION_ROOT}/ToolAddImpulse.cpp
		${PEEL_APPLICATION_ROOT}/ToolBullet.cpp
		${PEEL_APPLICATION_ROOT}/ToolCreateJoint.cpp
		${PEEL_APPLICATION_ROOT}/ToolCreateRope.cpp
		${PEEL_APPLICATION_ROOT}/ToolObjectCreate.cpp
		${PEEL_APPLICATION_ROOT}/ToolPicking.cpp
		${PEEL_APPLICATION_ROOT}/ToolRayBased.cpp
		${PEEL_APPLICATION_ROOT}/ToolShootObject.cpp
		${PEEL_APPLICATION_ROOT}/ToolTerrainEditor.cpp
		${PEEL_APPLICATION_ROOT}/ToolTexture.cpp
		${PEEL_APPLICATION_ROOT}/ToolRotate.cpp
		${PEEL_APPLICATION_ROOT}/ToolTransform.cpp
		${PEEL_APPLICATION_ROOT}/ToolTranslate.cpp
		${PEEL_APPLICATION_ROOT}/PINT_Editor.cpp
		${PEEL_APPLICATION_ROOT}/ScreenQuad.cpp
		${PEEL_APPLICATION_ROOT}/ScreenQuad_BackColor.cpp
		${PEEL_APPLICATION_ROOT}/ScreenQuad_ColorGradient.cpp
		${PEEL_APPLICATION_ROOT}/ScreenQuad_ColorSphere.cpp
		${PEEL_APPLICATION_ROOT}/RaytracingTest.cpp
		${PEEL_APPLICATION_ROOT}/GLRenderStates.cpp
		${PEEL_APPLICATION_ROOT}/MeshCleaner.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsFoundation.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsAllocator.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsAssert.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsMathUtils.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsString.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsTempAllocator.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsUtilities.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsAtomic.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsCpu.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsFPU.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsMutex.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsPrintString.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsSList.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsSocket.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsSync.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsThread.cpp
		${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsTime.cpp
		${PEEL_APPLICATION_ROOT}/LegoLib/LegoLib.h
		${PEEL_APPLICATION_ROOT}/Loader_Bin.h
		${PEEL_APPLICATION_ROOT}/Loader_Obj.h
		${PEEL_APPLICATION_ROOT}/Loader_Rays.h
		${PEEL_APPLICATION_ROOT}/Loader_RepX.h
		${PEEL_APPLICATION_ROOT}/Loader_ShapeProfile.h
		${PEEL_APPLICATION_ROOT}/USDExport.h
		${PEEL_APPLICATION_ROOT}/ZB2Export.h
		${PEEL_APPLICATION_ROOT}/ZB2Import.h
		${PEEL_APPLICATION_ROOT}/ZCB/IceZCBBreaker.h
		${PEEL_APPLICATION_ROOT}/ZCB/IceZCBFormat.h
		${PEEL_APPLICATION_ROOT}/ZCB/PINT_ZCB.h
		${PEEL_APPLICATION_ROOT}/ZCB/PINT_ZCB2.h
		${PEEL_APPLICATION_ROOT}/Zcb2_RenderData.h
		${PEEL_APPLICATION_ROOT}/GUI_ActorEdit.h
		${PEEL_APPLICATION_ROOT}/GUI_ActorSelection.h
		${PEEL_APPLICATION_ROOT}/GUI_CompoundEdit.h
		${PEEL_APPLICATION_ROOT}/GUI_EditBox.h
		${PEEL_APPLICATION_ROOT}/GUI_Helpers.h
		${PEEL_APPLICATION_ROOT}/GUI_ImportCollada.h
		${PEEL_APPLICATION_ROOT}/GUI_JointEdit.h
		${PEEL_APPLICATION_ROOT}/GUI_JointParams.h
		${PEEL_APPLICATION_ROOT}/GUI_PosEdit.h
		${PEEL_APPLICATION_ROOT}/GUI_RenderInterface.h
		${PEEL_APPLICATION_ROOT}/PintGUIHelper.h
		${PEEL_APPLICATION_ROOT}/ProgressBar.h
		${PEEL_APPLICATION_ROOT}/RaytracingWindow.h
		${PEEL_APPLICATION_ROOT}/TitleWindow.h
		${PEEL_APPLICATION_ROOT}/Camera.h
		${PEEL_APPLICATION_ROOT}/CRC32.h
		${PEEL_APPLICATION_ROOT}/Devil.h
		${PEEL_APPLICATION_ROOT}/Gamepad.h
		${PEEL_APPLICATION_ROOT}/QPCTime.h
		${PEEL_APPLICATION_ROOT}/Sound.h
		${PEEL_APPLICATION_ROOT}/SupportFile.h
		${PEEL_APPLICATION_ROOT}/Capsule.h
		${PEEL_APPLICATION_ROOT}/Cylinder.h
		${PEEL_APPLICATION_ROOT}/IceBunny.h
		${PEEL_APPLICATION_ROOT}/LoopTheLoop.h
		${PEEL_APPLICATION_ROOT}/MyConvex.h
		${PEEL_APPLICATION_ROOT}/ProceduralTrack.h
		${PEEL_APPLICATION_ROOT}/RevolutionShape.h
		${PEEL_APPLICATION_ROOT}/Sphere.h
		${PEEL_APPLICATION_ROOT}/Terrain.h
		${PEEL_APPLICATION_ROOT}/GLConvexRenderer.h
		${PEEL_APPLICATION_ROOT}/GLFontData.h
		${PEEL_APPLICATION_ROOT}/GLFontRenderer.h
		${PEEL_APPLICATION_ROOT}/GLMesh.h
		${PEEL_APPLICATION_ROOT}/GLPointRenderer.h
		${PEEL_APPLICATION_ROOT}/GLPointRenderer2.h
		${PEEL_APPLICATION_ROOT}/GLRenderHelpers.h
		${PEEL_APPLICATION_ROOT}/GLScaledCylinder.h
		${PEEL_APPLICATION_ROOT}/GLShader.h
		${PEEL_APPLICATION_ROOT}/GLTexture.h
		${PEEL_APPLICATION_ROOT}/GLVSync.h
		${PEEL_APPLICATION_ROOT}/HACD/hacdCircularList.h
		${PEEL_APPLICATION_ROOT}/HACD/hacdGraph.h
		${PEEL_APPLICATION_ROOT}/HACD/hacdHACD.h
		${PEEL_APPLICATION_ROOT}/HACD/hacdICHull.h
		${PEEL_APPLICATION_ROOT}/HACD/hacdManifoldMesh.h
		${PEEL_APPLICATION_ROOT}/HACD/hacdVector.h
		${PEEL_APPLICATION_ROOT}/HACD/hacdVersion.h
		${PEEL_APPLICATION_ROOT}/Fracture/Fracture.h
		${PEEL_APPLICATION_ROOT}/Fracture/MultiConvex.h
		${PEEL_APPLICATION_ROOT}/Voronoi2D.h
		${PEEL_APPLICATION_ROOT}/MinimalRegionManager.h
		${PEEL_APPLICATION_ROOT}/Streaming.h
		${PEEL_APPLICATION_ROOT}/TerrainRegionManager.h
		${PEEL_APPLICATION_ROOT}/TerrainStreamingUI.h
		${PEEL_APPLICATION_ROOT}/Scattering.h
		${PEEL_APPLICATION_ROOT}/TerrainManager.h
		${PEEL_APPLICATION_ROOT}/LZ4/lz4.h
		${PEEL_APPLICATION_ROOT}/LZ4/lz4frame.h
		${PEEL_APPLICATION_ROOT}/LZ4/lz4frame_static.h
		${PEEL_APPLICATION_ROOT}/LZ4/lz4hc.h
		${PEEL_APPLICATION_ROOT}/LZ4/xxhash.h
		${PEEL_APPLICATION_ROOT}/TestScenes.h
		${PEEL_APPLICATION_ROOT}/TestScenes_Heightfield.h
		${PEEL_APPLICATION_ROOT}/TestScenes_VehiclesBase.h
		${PEEL_APPLICATION_ROOT}/TestScenesHelpers.h
		${PEEL_APPLICATION_ROOT}/FrameBufferObject.h
		${PEEL_APPLICATION_ROOT}/PintRender.h
		${PEEL_APPLICATION_ROOT}/PintRenderPass.h
		${PEEL_APPLICATION_ROOT}/PintRenderState.h
		${PEEL_APPLICATION_ROOT}/RenderTarget.h
		${PEEL_APPLICATION_ROOT}/ShadowMap.h
		${PEEL_APPLICATION_ROOT}/PintBatchConvexShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintColorShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintConvexInstanceShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintGLMeshShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintNullRenderer.h
		${PEEL_APPLICATION_ROOT}/PintPointSpriteSphereShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintTerrainTileRenderer.h
		${PEEL_APPLICATION_ROOT}/PintDLBoxShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintDLCapsuleShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintDLConvexShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintDLCylinderShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintDLMeshShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintDLShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/PintDLSphereShapeRenderer.h
		${PEEL_APPLICATION_ROOT}/RenderModel.h
		${PEEL_APPLICATION_ROOT}/RenderModelFFP.h
		${PEEL_APPLICATION_ROOT}/Shader.h
		${PEEL_APPLICATION_ROOT}/MatcapShader.h
		${PEEL_APPLICATION_ROOT}/RenderModelMatcap.h
		${PEEL_APPLICATION_ROOT}/RenderModelSimpleShader.h
		${PEEL_APPLICATION_ROOT}/SimpleShader.h
		${PEEL_APPLICATION_ROOT}/FlatShader.h
		${PEEL_APPLICATION_ROOT}/RenderModelSimpleShadows.h
		${PEEL_APPLICATION_ROOT}/ShadowShader.h
		${PEEL_APPLICATION_ROOT}/CameraManager.h
		${PEEL_APPLICATION_ROOT}/Common.h
		${PEEL_APPLICATION_ROOT}/ControlInterface.h
		${PEEL_APPLICATION_ROOT}/CustomICEAllocator.h
		${PEEL_APPLICATION_ROOT}/DefaultControlInterface.h
		${PEEL_APPLICATION_ROOT}/DefaultEnv.h
		${PEEL_APPLICATION_ROOT}/DisplayTexture.h
		${PEEL_APPLICATION_ROOT}/Grid.h
		${PEEL_APPLICATION_ROOT}/PEEL.h
		${PEEL_APPLICATION_ROOT}/PEEL_MenuBar.h
		${PEEL_APPLICATION_ROOT}/PEEL_Settings.h
		${PEEL_APPLICATION_ROOT}/PEEL_Threads.h
		${PEEL_APPLICATION_ROOT}/PhysicsData.h
		${PEEL_APPLICATION_ROOT}/Pint.h
		${PEEL_APPLICATION_ROOT}/PintDef.h
		${PEEL_APPLICATION_ROOT}/PintEngineData.h
		${PEEL_APPLICATION_ROOT}/PintObjectsManager.h
		${PEEL_APPLICATION_ROOT}/PintSelectionManager.h
		${PEEL_APPLICATION_ROOT}/PintSQ.h
		${PEEL_APPLICATION_ROOT}/PintSurfaceInterface.h
		${PEEL_APPLICATION_ROOT}/PintTiming.h
		${PEEL_APPLICATION_ROOT}/PintVisibilityManager.h
		${PEEL_APPLICATION_ROOT}/Plugins.h
		${PEEL_APPLICATION_ROOT}/Profiling.h
		${PEEL_APPLICATION_ROOT}/RepX_Tools.h
		${PEEL_APPLICATION_ROOT}/RoundCorners.h
		${PEEL_APPLICATION_ROOT}/Script.h
		${PEEL_APPLICATION_ROOT}/SourceRay.h
		${PEEL_APPLICATION_ROOT}/stdafx.h
		${PEEL_APPLICATION_ROOT}/SurfaceManager.h
		${PEEL_APPLICATION_ROOT}/targetver.h
		${PEEL_APPLICATION_ROOT}/TestSelector.h
		${PEEL_APPLICATION_ROOT}/TextureManager.h
		${PEEL_APPLICATION_ROOT}/TrashCache.h
		${PEEL_APPLICATION_ROOT}/Tool.h
		${PEEL_APPLICATION_ROOT}/ToolAddImpulse.h
		${PEEL_APPLICATION_ROOT}/ToolBullet.h
		${PEEL_APPLICATION_ROOT}/ToolCreateJoint.h
		${PEEL_APPLICATION_ROOT}/ToolCreateRope.h
		${PEEL_APPLICATION_ROOT}/ToolInterface.h
		${PEEL_APPLICATION_ROOT}/ToolObjectCreate.h
		${PEEL_APPLICATION_ROOT}/ToolPicking.h
		${PEEL_APPLICATION_ROOT}/ToolRayBased.h
		${PEEL_APPLICATION_ROOT}/ToolShootObject.h
		${PEEL_APPLICATION_ROOT}/ToolTerrainEditor.h
		${PEEL_APPLICATION_ROOT}/ToolTexture.h
		${PEEL_APPLICATION_ROOT}/ToolRotate.h
		${PEEL_APPLICATION_ROOT}/ToolTransform.h
		${PEEL_APPLICATION_ROOT}/ToolTranslate.h
		${PEEL_APPLICATION_ROOT}/PINT_Editor.h
		${PEEL_APPLICATION_ROOT}/ScreenQuad.h
		${PEEL_APPLICATION_ROOT}/ScreenQuad_BackColor.h
		${PEEL_APPLICATION_ROOT}/ScreenQuad_ColorGradient.h
		${PEEL_APPLICATION_ROOT}/ScreenQuad_ColorSphere.h
		${PEEL_APPLICATION_ROOT}/RaytracingTest.h
		${PEEL_APPLICATION_ROOT}/resource.h
		${PEEL_APPLICATION_ROOT}/GLRenderStates.h
		${PEEL_APPLICATION_ROOT}/MeshCleaner.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/windows/PxWindowsIntrinsics.h
		${PEEL_APPLICATION_ROOT}/ICE_To_PX.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/Ps.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsAlignedMalloc.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsAlloca.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsAllocator.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsAoS.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsArray.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsAtomic.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsBasicTemplates.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsBitUtils.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsBroadcast.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsCpu.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsFoundation.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsFPU.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsHash.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsHashInternals.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsHashMap.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsHashSet.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsInlineAllocator.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsInlineAoS.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsInlineArray.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsIntrinsics.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsMathUtils.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsMutex.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsPool.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsSList.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsSocket.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsSort.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsSortInternals.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsString.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsSync.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsTempAllocator.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsThread.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsTime.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsUserAllocated.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsUtilities.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsVecMath.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsVecMathAoSScalar.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsVecMathAoSScalarInline.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsVecMathSSE.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsVecMathUtilities.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsVecQuat.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/PsVecTransform.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/windows/PsWindowsAoS.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/windows/PsWindowsFPU.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/windows/PsWindowsInclude.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/windows/PsWindowsInlineAoS.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/windows/PsWindowsIntrinsics.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/include/windows/PsWindowsTrigConstants.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/Px.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxAllocatorCallback.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxAssert.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxBitAndData.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxBounds3.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxErrorCallback.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxErrors.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxFlags.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxFoundation.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxFoundationConfig.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxIntrinsics.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxIO.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxMat33.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxMat44.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxMath.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxMathUtils.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxMemory.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxPhysicsVersion.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxPlane.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxPreprocessor.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxProfiler.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxQuat.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxSharedAssert.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxSimpleTypes.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxStrideIterator.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxTransform.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxUnionCast.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxVec2.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxVec3.h
		${PEEL_APPLICATION_ROOT}/PxFoundation/PxVec4.h
		${PEEL_APPLICATION_ROOT}/HACD/hacdCircularList.inl
		${PEEL_APPLICATION_ROOT}/HACD/hacdVector.inl
		${PEEL_APPLICATION_ROOT}/Fracture/Convex.h
		${PEEL_APPLICATION_ROOT}/Fracture/Delaunay3d.h
		${PEEL_APPLICATION_ROOT}/Fracture/FracturePattern.h
		"${PEEL_REPO_ROOT}/Media/#Shaders/RenderModel_Mapcap_ps.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/RenderModel_Mapcap_vs.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/RenderModel_SimpleShader1_ps.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/RenderModel_SimpleShader1_vs.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/RenderModel_SimpleShader2_ps.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/RenderModel_SimpleShader2_vs.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/RenderModel_SimpleShadows_ps.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/RenderModel_SimpleShadows_vs.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/ScreenQuad_ColorSphere2_ps.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/ScreenQuad_ColorSphere_ps.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/ScreenQuad_ColorSphere_vs.h"
		"${PEEL_REPO_ROOT}/Media/#Shaders/ScreenQuad_Default_vs.h"
		)

set(APP_ICON_RESOURCE_WINDOWS "${PEEL_APPLICATION_ROOT}/PEEL.rc")

set_source_files_properties(
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsFPU.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsMutex.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsPrintString.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsSocket.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsSList.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsThread.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsSync.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsTime.cpp"
		"${PEEL_APPLICATION_ROOT}/HACD/hacdGraph.cpp"
		"${PEEL_APPLICATION_ROOT}/HACD/hacdICHull.cpp"
		"${PEEL_APPLICATION_ROOT}/HACD/hacdHACD.cpp"
		"${PEEL_APPLICATION_ROOT}/HACD/hacdManifoldMesh.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsFoundation.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsAllocator.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsAssert.cp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsString.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsMathUtils.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsUtilities.cp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsAtomic.cp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsCpu.cp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsTempAllocator.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsAssert.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/PsUtilities.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsAtomic.cpp"
		"${PEEL_APPLICATION_ROOT}/PxFoundation/src/windows/PsWindowsCpu.cpp"
		PROPERTIES SKIP_PRECOMPILE_HEADERS ON)

set_source_files_properties(
		"${PEEL_APPLICATION_ROOT}/LZ4/lz4.c"
		"${PEEL_APPLICATION_ROOT}/LZ4/lz4frame.c"
		"${PEEL_APPLICATION_ROOT}/LZ4/lz4hc.c"
		"${PEEL_APPLICATION_ROOT}/LZ4/xxhash.c"
		PROPERTIES LANGUAGE CXX
		SKIP_PRECOMPILE_HEADERS ON)

# Group source files
source_group(TREE ${PEEL_REPO_ROOT} FILES ${PEEL_SRC_FILES})

# Create PEEL lib
add_executable(PEEL
		${PEEL_SRC_FILES}
		${APP_ICON_RESOURCE_WINDOWS})

# Set the correct working directory
set_property(TARGET PEEL PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${PEEL_APPLICATION_ROOT}")
set_property(TARGET PEEL PROPERTY CXX_STANDARD 17)

set_target_properties(PEEL
		PROPERTIES
		ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<IF:$<CONFIG:Debug>,Debug,Release>"
		LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<IF:$<CONFIG:Debug>,Debug,Release>"
		RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/$<IF:$<CONFIG:Debug>,Debug,Release>"
		)

target_precompile_headers(PEEL PRIVATE ${PEEL_APPLICATION_ROOT}/stdafx.h)

set_target_properties(PEEL PROPERTIES
		DEBUG_POSTFIX _DEBUG)

target_link_options(PEEL
		PRIVATE /SUBSYSTEM:CONSOLE /NODEFAULTLIB:LIBCMT$<$<CONFIG:debug>:D>)

target_compile_options(PEEL PRIVATE
		$<$<CXX_COMPILER_ID:MSVC>:/WX>
		$<$<NOT:$<CXX_COMPILER_ID:MSVC>>:-Werror>
		)

target_compile_definitions(PEEL PRIVATE
		_CONSOLE
		GLUT_NO_LIB_PRAGMA
		PX_PHYSX_STATIC_LIB)

target_include_directories(PEEL SYSTEM BEFORE
		PUBLIC ${PEEL_SOURCE_ROOT}
		PUBLIC ${PEEL_APPLICATION_ROOT}
		PUBLIC ${PEEL_APPLICATION_ROOT}/Ice/APIs/Ice/Plugins/FlexineSDK
		PUBLIC ${PEEL_APPLICATION_ROOT}/Ice/APIs/Ice
		PUBLIC ${PEEL_APPLICATION_ROOT}/HACD
		PUBLIC ${PEEL_APPLICATION_ROOT}/Glut/include
		PUBLIC ${PEEL_APPLICATION_ROOT}/DevIL/include
		PUBLIC ${PEEL_APPLICATION_ROOT}/PxFoundation
		PUBLIC ${PEEL_APPLICATION_ROOT}/PxFoundation/include
		PUBLIC ${PEEL_REPO_ROOT}/Externals
		PUBLIC ${PEEL_REPO_ROOT}/Externals/DevIL/include
		PUBLIC ${PEEL_REPO_ROOT}/Externals/fmod/3.75/inc
		PUBLIC ${PEEL_REPO_ROOT}/Private/NVD)

target_link_directories(PEEL
		PUBLIC "${PEEL_APPLICATION_ROOT}/Ice/Lib${PEEL_SYSTEM_BIN_POSTFIX}"
		PUBLIC "${PEEL_APPLICATION_ROOT}/GL"
		PUBLIC "${PEEL_APPLICATION_ROOT}/GlutX/Lib"
		PUBLIC "${PEEL_REPO_ROOT}/Externals")

target_link_libraries(PEEL
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

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} Microsoft.VC90.DebugCRT.manifest)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} msvcm90d.dll)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} msvcp90.dll)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} msvcp90d.dll)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} msvcr90.dll)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} msvcr90d.dll)
else ()
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} msvcp90.dll)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} msvcr90.dll)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} msvcr90d.dll)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} nvToolsExt32_1.dll)
	copy_peel_dependency(Externals/VC9/${PEEL_BIN_DIR_NAME} cudart32_30_9.dll)
endif ()

copy_peel_dependency(Externals/fmod/3.75/bin fmod${PEEL_SYSTEM_BIN_POSTFIX}.dll)

if (CMAKE_SIZEOF_VOID_P EQUAL 8)
	copy_peel_dependency(Externals/DevIL/lib/x64/Release DevIL.dll)
else ()
	copy_peel_dependency(Externals/DevIL/lib/x86/Release DevIL.dll)
endif ()

copy_peel_dependency(Src/PEEL/GL glut32.dll)
copy_peel_dependency(Src/PEEL/GL glew32.dll)
copy_peel_dependency(Src/PEEL/GL glew64.dll)

copy_peel_dependency_variant(Src/PEEL/GlutX/Bin GlutX)

copy_peel_dependency_variant(Src/PEEL/Ice/Bin/${PEEL_BIN_DIR_NAME} Contact)
copy_peel_dependency_variant(Src/PEEL/Ice/Bin/${PEEL_BIN_DIR_NAME} IceCharacter)
copy_peel_dependency_variant(Src/PEEL/Ice/Bin/${PEEL_BIN_DIR_NAME} IceCore)
copy_peel_dependency_variant(Src/PEEL/Ice/Bin/${PEEL_BIN_DIR_NAME} IceGUI)
copy_peel_dependency_variant(Src/PEEL/Ice/Bin/${PEEL_BIN_DIR_NAME} IceImageWork)
copy_peel_dependency_variant(Src/PEEL/Ice/Bin/${PEEL_BIN_DIR_NAME} IceMaths)
copy_peel_dependency_variant(Src/PEEL/Ice/Bin/${PEEL_BIN_DIR_NAME} IceRenderer)
copy_peel_dependency_variant(Src/PEEL/Ice/Bin/${PEEL_BIN_DIR_NAME} IceTerrain)
copy_peel_dependency_variant(Src/PEEL/Ice/Bin/${PEEL_BIN_DIR_NAME} Meshmerizer)
