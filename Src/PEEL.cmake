# Root
set(PEEL_ROOT ${PEEL_SOURCE_ROOT})
set(PEEL_REPO_ROOT ${PEEL_SOURCE_ROOT}../)

# Source files
set(PEEL_SRC_FILES
    ${PEEL_ROOT}/LegoLib/LegoLib.cpp
    ${PEEL_ROOT}/Loader_Bin.cpp
    ${PEEL_ROOT}/Loader_Obj.cpp
    ${PEEL_ROOT}/Loader_Rays.cpp
    ${PEEL_ROOT}/Loader_RepX.cpp
    ${PEEL_ROOT}/Loader_ShapeProfile.cpp
    ${PEEL_ROOT}/USDExport.cpp
    ${PEEL_ROOT}/ZB2Export.cpp
    ${PEEL_ROOT}/ZB2Import.cpp
    ${PEEL_ROOT}/ZCB/IceZCBBreaker.cpp
    ${PEEL_ROOT}/ZCB/PINT_ZCB.cpp
    ${PEEL_ROOT}/ZCB/PINT_ZCB2.cpp
    ${PEEL_ROOT}/ZCB/PINT_ZCB2_IceChunks.cpp
    ${PEEL_ROOT}/Zcb2_RenderData.cpp
    ${PEEL_ROOT}/GUI_ActorEdit.cpp
    ${PEEL_ROOT}/GUI_ActorSelection.cpp
    ${PEEL_ROOT}/GUI_CompoundEdit.cpp
    ${PEEL_ROOT}/GUI_EditBox.cpp
    ${PEEL_ROOT}/GUI_Helpers.cpp
    ${PEEL_ROOT}/GUI_ImportCollada.cpp
    ${PEEL_ROOT}/GUI_JointEdit.cpp
    ${PEEL_ROOT}/GUI_JointParams.cpp
    ${PEEL_ROOT}/GUI_PosEdit.cpp
    ${PEEL_ROOT}/PintGUIHelper.cpp
    ${PEEL_ROOT}/ProgressBar.cpp
    ${PEEL_ROOT}/RaytracingWindow.cpp
    ${PEEL_ROOT}/TitleData.cpp
    ${PEEL_ROOT}/TitleWindow.cpp
    ${PEEL_ROOT}/Camera.cpp
    ${PEEL_ROOT}/ConvexHull2D.cpp
    ${PEEL_ROOT}/CRC32.cpp
    ${PEEL_ROOT}/Devil.cpp
    ${PEEL_ROOT}/Gamepad.cpp
    ${PEEL_ROOT}/QPCTime.cpp
    ${PEEL_ROOT}/Sound.cpp
    ${PEEL_ROOT}/SupportFile.cpp
    ${PEEL_ROOT}/Capsule.cpp
    ${PEEL_ROOT}/Cylinder.cpp
    ${PEEL_ROOT}/IceBunny.cpp
    ${PEEL_ROOT}/LoopTheLoop.cpp
    ${PEEL_ROOT}/MyConvex.cpp
    ${PEEL_ROOT}/ProceduralTrack.cpp
    ${PEEL_ROOT}/RevolutionShape.cpp
    ${PEEL_ROOT}/Sphere.cpp
    ${PEEL_ROOT}/Terrain.cpp
    ${PEEL_ROOT}/GLConvexRenderer.cpp
    ${PEEL_ROOT}/GLFontRenderer.cpp
    ${PEEL_ROOT}/GLMesh.cpp
    ${PEEL_ROOT}/GLPointRenderer.cpp
    ${PEEL_ROOT}/GLPointRenderer2.cpp
    ${PEEL_ROOT}/GLRenderHelpers.cpp
    ${PEEL_ROOT}/GLScaledCylinder.cpp
    ${PEEL_ROOT}/GLShader.cpp
    ${PEEL_ROOT}/GLTexture.cpp
    ${PEEL_ROOT}/GLVSync.cpp
    ${PEEL_ROOT}/HACD/hacdGraph.cpp
    ${PEEL_ROOT}/HACD/hacdHACD.cpp
    ${PEEL_ROOT}/HACD/hacdICHull.cpp
    ${PEEL_ROOT}/HACD/hacdManifoldMesh.cpp
    ${PEEL_ROOT}/Fracture/Convex.cpp
    ${PEEL_ROOT}/Fracture/Delaunay3d.cpp
    ${PEEL_ROOT}/Fracture/Fracture.cpp
    ${PEEL_ROOT}/Fracture/FracturePattern.cpp
    ${PEEL_ROOT}/Fracture/MultiConvex.cpp
    ${PEEL_ROOT}/Voronoi2D.cpp
    ${PEEL_ROOT}/MinimalRegionManager.cpp
    ${PEEL_ROOT}/Streaming.cpp
    ${PEEL_ROOT}/TerrainRegionManager.cpp
    ${PEEL_ROOT}/TerrainStreamingUI.cpp
    ${PEEL_ROOT}/Scattering.cpp
    ${PEEL_ROOT}/TerrainManager.cpp
    ${PEEL_ROOT}/LZ4/lz4.c
    ${PEEL_ROOT}/LZ4/lz4frame.c
    ${PEEL_ROOT}/LZ4/lz4hc.c
    ${PEEL_ROOT}/LZ4/xxhash.c
    ${PEEL_ROOT}/TestScenes.cpp
    ${PEEL_ROOT}/TestScenes_API.cpp
    ${PEEL_ROOT}/TestScenes_Behavior.cpp
    ${PEEL_ROOT}/TestScenes_CCD.cpp
    ${PEEL_ROOT}/TestScenes_CCT.cpp
    ${PEEL_ROOT}/TestScenes_ContactGeneration.cpp
    ${PEEL_ROOT}/TestScenes_Cooking.cpp
    ${PEEL_ROOT}/TestScenes_Cylinders.cpp
    ${PEEL_ROOT}/TestScenes_Fracture.cpp
    ${PEEL_ROOT}/TestScenes_Heightfield.cpp
    ${PEEL_ROOT}/TestScenes_Import.cpp
    ${PEEL_ROOT}/TestScenes_Kinematics.cpp
    ${PEEL_ROOT}/TestScenes_Performance.cpp
    ${PEEL_ROOT}/TestScenes_StaticScene.cpp
    ${PEEL_ROOT}/TestScenes_Undefined.cpp
    ${PEEL_ROOT}/TestScenes_Vehicles.cpp
    ${PEEL_ROOT}/TestScenes_VehiclesBase.cpp
    ${PEEL_ROOT}/TestScenesHelpers.cpp
    ${PEEL_ROOT}/TestScenes_Midphase.cpp
    ${PEEL_ROOT}/TestScenes_MidphaseMeshMesh.cpp
    ${PEEL_ROOT}/TestScenes_Overlap.cpp
    ${PEEL_ROOT}/TestScenes_Raycast.cpp
    ${PEEL_ROOT}/TestScenes_Sweep.cpp
    ${PEEL_ROOT}/TestScenes_Bulldozer_WIP.cpp
    ${PEEL_ROOT}/TestScenes_Joints_WIP.cpp
    ${PEEL_ROOT}/TestScenes_Terrain.cpp
    ${PEEL_ROOT}/TestScenes_Articulations.cpp
    ${PEEL_ROOT}/TestScenes_MCArticulations.cpp
    ${PEEL_ROOT}/TestScenes_RCArticulations.cpp
    ${PEEL_ROOT}/TestScenes_BasicJoints.cpp
    ${PEEL_ROOT}/TestScenes_D6.cpp
    ${PEEL_ROOT}/TestScenes_Joints.cpp
    ${PEEL_ROOT}/TestScenes_Portals.cpp
    ${PEEL_ROOT}/FrameBufferObject.cpp
    ${PEEL_ROOT}/PintRender.cpp
    ${PEEL_ROOT}/PintRenderState.cpp
    ${PEEL_ROOT}/RenderTarget.cpp
    ${PEEL_ROOT}/ShadowMap.cpp
    ${PEEL_ROOT}/PintBatchConvexShapeRenderer.cpp
    ${PEEL_ROOT}/PintColorShapeRenderer.cpp
    ${PEEL_ROOT}/PintConvexInstanceShapeRenderer.cpp
    ${PEEL_ROOT}/PintGLMeshShapeRenderer.cpp
    ${PEEL_ROOT}/PintPointSpriteSphereShapeRenderer.cpp
    ${PEEL_ROOT}/PintShapeRenderer.cpp
    ${PEEL_ROOT}/PintTerrainTileRenderer.cpp
    ${PEEL_ROOT}/PintDLBoxShapeRenderer.cpp
    ${PEEL_ROOT}/PintDLCapsuleShapeRenderer.cpp
    ${PEEL_ROOT}/PintDLConvexShapeRenderer.cpp
    ${PEEL_ROOT}/PintDLCylinderShapeRenderer.cpp
    ${PEEL_ROOT}/PintDLMeshShapeRenderer.cpp
    ${PEEL_ROOT}/PintDLShapeRenderer.cpp
    ${PEEL_ROOT}/PintDLSphereShapeRenderer.cpp
    ${PEEL_ROOT}/RenderModel.cpp
    ${PEEL_ROOT}/RenderModelFFP.cpp
    ${PEEL_ROOT}/Shader.cpp
    ${PEEL_ROOT}/MatcapShader.cpp
    ${PEEL_ROOT}/RenderModelMatcap.cpp
    ${PEEL_ROOT}/RenderModelSimpleShader.cpp
    ${PEEL_ROOT}/SimpleShader.cpp
    ${PEEL_ROOT}/FlatShader.cpp
    ${PEEL_ROOT}/RenderModelSimpleShadows.cpp
    ${PEEL_ROOT}/ShadowShader.cpp
    ${PEEL_ROOT}/CameraManager.cpp
    ${PEEL_ROOT}/Common.cpp
    ${PEEL_ROOT}/ControlInterface.cpp
    ${PEEL_ROOT}/CustomICEAllocator.cpp
    ${PEEL_ROOT}/DefaultControlInterface.cpp
    ${PEEL_ROOT}/DefaultEnv.cpp
    ${PEEL_ROOT}/DisplayTexture.cpp
    ${PEEL_ROOT}/Foundation.cpp
    ${PEEL_ROOT}/Grid.cpp
    ${PEEL_ROOT}/PEEL.cpp
    ${PEEL_ROOT}/PEEL_MenuBar.cpp
    ${PEEL_ROOT}/PEEL_Threads.cpp
    ${PEEL_ROOT}/PhysicsData.cpp
    ${PEEL_ROOT}/Pint.cpp
    ${PEEL_ROOT}/PintEngineData.cpp
    ${PEEL_ROOT}/PintObjectsManager.cpp
    ${PEEL_ROOT}/PintSelectionManager.cpp
    ${PEEL_ROOT}/PintSQ.cpp
    ${PEEL_ROOT}/PintTiming.cpp
    ${PEEL_ROOT}/PintVisibilityManager.cpp
    ${PEEL_ROOT}/Plugins.cpp
    ${PEEL_ROOT}/RepX_Tools.cpp
    ${PEEL_ROOT}/RoundCorners.cpp
    ${PEEL_ROOT}/Script.cpp
    ${PEEL_ROOT}/Simulate.cpp
    ${PEEL_ROOT}/Starter.cpp
    ${PEEL_ROOT}/stdafx.cpp
    ${PEEL_ROOT}/SurfaceManager.cpp
    ${PEEL_ROOT}/TestSelector.cpp
    ${PEEL_ROOT}/TextureManager.cpp
    ${PEEL_ROOT}/TrashCache.cpp
    ${PEEL_ROOT}/Tool.cpp
    ${PEEL_ROOT}/ToolAddImpulse.cpp
    ${PEEL_ROOT}/ToolBullet.cpp
    ${PEEL_ROOT}/ToolCreateJoint.cpp
    ${PEEL_ROOT}/ToolCreateRope.cpp
    ${PEEL_ROOT}/ToolObjectCreate.cpp
    ${PEEL_ROOT}/ToolPicking.cpp
    ${PEEL_ROOT}/ToolRayBased.cpp
    ${PEEL_ROOT}/ToolShootObject.cpp
    ${PEEL_ROOT}/ToolTerrainEditor.cpp
    ${PEEL_ROOT}/ToolTexture.cpp
    ${PEEL_ROOT}/ToolRotate.cpp
    ${PEEL_ROOT}/ToolTransform.cpp
    ${PEEL_ROOT}/ToolTranslate.cpp
    ${PEEL_ROOT}/PINT_Editor.cpp
    ${PEEL_ROOT}/ScreenQuad.cpp
    ${PEEL_ROOT}/ScreenQuad_BackColor.cpp
    ${PEEL_ROOT}/ScreenQuad_ColorGradient.cpp
    ${PEEL_ROOT}/ScreenQuad_ColorSphere.cpp
    ${PEEL_ROOT}/RaytracingTest.cpp
    ${PEEL_ROOT}/GLRenderStates.cpp
    ${PEEL_ROOT}/MeshCleaner.cpp
    ${PEEL_ROOT}/PxFoundation/src/PsFoundation.cpp
    ${PEEL_ROOT}/PxFoundation/src/PsAllocator.cpp
    ${PEEL_ROOT}/PxFoundation/src/PsAssert.cpp
    ${PEEL_ROOT}/PxFoundation/src/PsMathUtils.cpp
    ${PEEL_ROOT}/PxFoundation/src/PsString.cpp
    ${PEEL_ROOT}/PxFoundation/src/PsTempAllocator.cpp
    ${PEEL_ROOT}/PxFoundation/src/PsUtilities.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsAtomic.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsCpu.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsFPU.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsMutex.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsPrintString.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsSList.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsSocket.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsSync.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsThread.cpp
    ${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsTime.cpp
    ${PEEL_ROOT}/LegoLib/LegoLib.h
    ${PEEL_ROOT}/Loader_Bin.h
    ${PEEL_ROOT}/Loader_Obj.h
    ${PEEL_ROOT}/Loader_Rays.h
    ${PEEL_ROOT}/Loader_RepX.h
    ${PEEL_ROOT}/Loader_ShapeProfile.h
    ${PEEL_ROOT}/USDExport.h
    ${PEEL_ROOT}/ZB2Export.h
    ${PEEL_ROOT}/ZB2Import.h
    ${PEEL_ROOT}/ZCB/IceZCBBreaker.h
    ${PEEL_ROOT}/ZCB/IceZCBFormat.h
    ${PEEL_ROOT}/ZCB/PINT_ZCB.h
    ${PEEL_ROOT}/ZCB/PINT_ZCB2.h
    ${PEEL_ROOT}/Zcb2_RenderData.h
    ${PEEL_ROOT}/GUI_ActorEdit.h
    ${PEEL_ROOT}/GUI_ActorSelection.h
    ${PEEL_ROOT}/GUI_CompoundEdit.h
    ${PEEL_ROOT}/GUI_EditBox.h
    ${PEEL_ROOT}/GUI_Helpers.h
    ${PEEL_ROOT}/GUI_ImportCollada.h
    ${PEEL_ROOT}/GUI_JointEdit.h
    ${PEEL_ROOT}/GUI_JointParams.h
    ${PEEL_ROOT}/GUI_PosEdit.h
    ${PEEL_ROOT}/GUI_RenderInterface.h
    ${PEEL_ROOT}/PintGUIHelper.h
    ${PEEL_ROOT}/ProgressBar.h
    ${PEEL_ROOT}/RaytracingWindow.h
    ${PEEL_ROOT}/TitleWindow.h
    ${PEEL_ROOT}/Camera.h
    ${PEEL_ROOT}/CRC32.h
    ${PEEL_ROOT}/Devil.h
    ${PEEL_ROOT}/Gamepad.h
    ${PEEL_ROOT}/QPCTime.h
    ${PEEL_ROOT}/Sound.h
    ${PEEL_ROOT}/SupportFile.h
    ${PEEL_ROOT}/Capsule.h
    ${PEEL_ROOT}/Cylinder.h
    ${PEEL_ROOT}/IceBunny.h
    ${PEEL_ROOT}/LoopTheLoop.h
    ${PEEL_ROOT}/MyConvex.h
    ${PEEL_ROOT}/ProceduralTrack.h
    ${PEEL_ROOT}/RevolutionShape.h
    ${PEEL_ROOT}/Sphere.h
    ${PEEL_ROOT}/Terrain.h
    ${PEEL_ROOT}/GLConvexRenderer.h
    ${PEEL_ROOT}/GLFontData.h
    ${PEEL_ROOT}/GLFontRenderer.h
    ${PEEL_ROOT}/GLMesh.h
    ${PEEL_ROOT}/GLPointRenderer.h
    ${PEEL_ROOT}/GLPointRenderer2.h
    ${PEEL_ROOT}/GLRenderHelpers.h
    ${PEEL_ROOT}/GLScaledCylinder.h
    ${PEEL_ROOT}/GLShader.h
    ${PEEL_ROOT}/GLTexture.h
    ${PEEL_ROOT}/GLVSync.h
    ${PEEL_ROOT}/HACD/hacdCircularList.h
    ${PEEL_ROOT}/HACD/hacdGraph.h
    ${PEEL_ROOT}/HACD/hacdHACD.h
    ${PEEL_ROOT}/HACD/hacdICHull.h
    ${PEEL_ROOT}/HACD/hacdManifoldMesh.h
    ${PEEL_ROOT}/HACD/hacdVector.h
    ${PEEL_ROOT}/HACD/hacdVersion.h
    ${PEEL_ROOT}/Fracture/Fracture.h
    ${PEEL_ROOT}/Fracture/MultiConvex.h
    ${PEEL_ROOT}/Voronoi2D.h
    ${PEEL_ROOT}/MinimalRegionManager.h
    ${PEEL_ROOT}/Streaming.h
    ${PEEL_ROOT}/TerrainRegionManager.h
    ${PEEL_ROOT}/TerrainStreamingUI.h
    ${PEEL_ROOT}/Scattering.h
    ${PEEL_ROOT}/TerrainManager.h
    ${PEEL_ROOT}/LZ4/lz4.h
    ${PEEL_ROOT}/LZ4/lz4frame.h
    ${PEEL_ROOT}/LZ4/lz4frame_static.h
    ${PEEL_ROOT}/LZ4/lz4hc.h
    ${PEEL_ROOT}/LZ4/xxhash.h
    ${PEEL_ROOT}/TestScenes.h
    ${PEEL_ROOT}/TestScenes_Heightfield.h
    ${PEEL_ROOT}/TestScenes_VehiclesBase.h
    ${PEEL_ROOT}/TestScenesHelpers.h
    ${PEEL_ROOT}/FrameBufferObject.h
    ${PEEL_ROOT}/PintRender.h
    ${PEEL_ROOT}/PintRenderPass.h
    ${PEEL_ROOT}/PintRenderState.h
    ${PEEL_ROOT}/RenderTarget.h
    ${PEEL_ROOT}/ShadowMap.h
    ${PEEL_ROOT}/PintBatchConvexShapeRenderer.h
    ${PEEL_ROOT}/PintColorShapeRenderer.h
    ${PEEL_ROOT}/PintConvexInstanceShapeRenderer.h
    ${PEEL_ROOT}/PintGLMeshShapeRenderer.h
    ${PEEL_ROOT}/PintNullRenderer.h
    ${PEEL_ROOT}/PintPointSpriteSphereShapeRenderer.h
    ${PEEL_ROOT}/PintShapeRenderer.h
    ${PEEL_ROOT}/PintTerrainTileRenderer.h
    ${PEEL_ROOT}/PintDLBoxShapeRenderer.h
    ${PEEL_ROOT}/PintDLCapsuleShapeRenderer.h
    ${PEEL_ROOT}/PintDLConvexShapeRenderer.h
    ${PEEL_ROOT}/PintDLCylinderShapeRenderer.h
    ${PEEL_ROOT}/PintDLMeshShapeRenderer.h
    ${PEEL_ROOT}/PintDLShapeRenderer.h
    ${PEEL_ROOT}/PintDLSphereShapeRenderer.h
    ${PEEL_ROOT}/RenderModel.h
    ${PEEL_ROOT}/RenderModelFFP.h
    ${PEEL_ROOT}/Shader.h
    ${PEEL_ROOT}/MatcapShader.h
    "${PEEL_ROOT}/../Media/#Shaders/RenderModel_Mapcap_ps.h"
    "${PEEL_ROOT}/../Media/#Shaders/RenderModel_Mapcap_vs.h"
    ${PEEL_ROOT}/RenderModelMatcap.h
    "${PEEL_ROOT}/../Media/#Shaders/RenderModel_SimpleShader1_ps.h"
    "${PEEL_ROOT}/../Media/#Shaders/RenderModel_SimpleShader1_vs.h"
    "${PEEL_ROOT}/../Media/#Shaders/RenderModel_SimpleShader2_ps.h"
    "${PEEL_ROOT}/../Media/#Shaders/RenderModel_SimpleShader2_vs.h"
    ${PEEL_ROOT}/RenderModelSimpleShader.h
    ${PEEL_ROOT}/SimpleShader.h
    ${PEEL_ROOT}/FlatShader.h
    "${PEEL_ROOT}/../Media/#Shaders/RenderModel_SimpleShadows_ps.h"
    "${PEEL_ROOT}/../Media/#Shaders/RenderModel_SimpleShadows_vs.h"
    ${PEEL_ROOT}/RenderModelSimpleShadows.h
    ${PEEL_ROOT}/ShadowShader.h
    ${PEEL_ROOT}/CameraManager.h
    ${PEEL_ROOT}/Common.h
    ${PEEL_ROOT}/ControlInterface.h
    ${PEEL_ROOT}/CustomICEAllocator.h
    ${PEEL_ROOT}/DefaultControlInterface.h
    ${PEEL_ROOT}/DefaultEnv.h
    ${PEEL_ROOT}/DisplayTexture.h
    ${PEEL_ROOT}/Grid.h
    ${PEEL_ROOT}/PEEL.h
    ${PEEL_ROOT}/PEEL_MenuBar.h
    ${PEEL_ROOT}/PEEL_Settings.h
    ${PEEL_ROOT}/PEEL_Threads.h
    ${PEEL_ROOT}/PhysicsData.h
    ${PEEL_ROOT}/Pint.h
    ${PEEL_ROOT}/PintDef.h
    ${PEEL_ROOT}/PintEngineData.h
    ${PEEL_ROOT}/PintObjectsManager.h
    ${PEEL_ROOT}/PintSelectionManager.h
    ${PEEL_ROOT}/PintSQ.h
    ${PEEL_ROOT}/PintSurfaceInterface.h
    ${PEEL_ROOT}/PintTiming.h
    ${PEEL_ROOT}/PintVisibilityManager.h
    ${PEEL_ROOT}/Plugins.h
    ${PEEL_ROOT}/Profiling.h
    ${PEEL_ROOT}/RepX_Tools.h
    ${PEEL_ROOT}/RoundCorners.h
    ${PEEL_ROOT}/Script.h
    ${PEEL_ROOT}/SourceRay.h
    ${PEEL_ROOT}/stdafx.h
    ${PEEL_ROOT}/SurfaceManager.h
    ${PEEL_ROOT}/targetver.h
    ${PEEL_ROOT}/TestSelector.h
    ${PEEL_ROOT}/TextureManager.h
    ${PEEL_ROOT}/TrashCache.h
    ${PEEL_ROOT}/Tool.h
    ${PEEL_ROOT}/ToolAddImpulse.h
    ${PEEL_ROOT}/ToolBullet.h
    ${PEEL_ROOT}/ToolCreateJoint.h
    ${PEEL_ROOT}/ToolCreateRope.h
    ${PEEL_ROOT}/ToolInterface.h
    ${PEEL_ROOT}/ToolObjectCreate.h
    ${PEEL_ROOT}/ToolPicking.h
    ${PEEL_ROOT}/ToolRayBased.h
    ${PEEL_ROOT}/ToolShootObject.h
    ${PEEL_ROOT}/ToolTerrainEditor.h
    ${PEEL_ROOT}/ToolTexture.h
    ${PEEL_ROOT}/ToolRotate.h
    ${PEEL_ROOT}/ToolTransform.h
    ${PEEL_ROOT}/ToolTranslate.h
    ${PEEL_ROOT}/PINT_Editor.h
    ${PEEL_ROOT}/ScreenQuad.h
    ${PEEL_ROOT}/ScreenQuad_BackColor.h
    ${PEEL_ROOT}/ScreenQuad_ColorGradient.h
    ${PEEL_ROOT}/ScreenQuad_ColorSphere.h
    "${PEEL_ROOT}/../Media/#Shaders/ScreenQuad_ColorSphere2_ps.h"
    "${PEEL_ROOT}/../Media/#Shaders/ScreenQuad_ColorSphere_ps.h"
    "${PEEL_ROOT}/../Media/#Shaders/ScreenQuad_ColorSphere_vs.h"
    "${PEEL_ROOT}/../Media/#Shaders/ScreenQuad_Default_vs.h"
    ${PEEL_ROOT}/RaytracingTest.h
    ${PEEL_ROOT}/resource.h
    ${PEEL_ROOT}/GLRenderStates.h
    ${PEEL_ROOT}/MeshCleaner.h
    ${PEEL_ROOT}/PxFoundation/windows/PxWindowsIntrinsics.h
    ${PEEL_ROOT}/ICE_To_PX.h
    ${PEEL_ROOT}/PxFoundation/include/Ps.h
    ${PEEL_ROOT}/PxFoundation/include/PsAlignedMalloc.h
    ${PEEL_ROOT}/PxFoundation/include/PsAlloca.h
    ${PEEL_ROOT}/PxFoundation/include/PsAllocator.h
    ${PEEL_ROOT}/PxFoundation/include/PsAoS.h
    ${PEEL_ROOT}/PxFoundation/include/PsArray.h
    ${PEEL_ROOT}/PxFoundation/include/PsAtomic.h
    ${PEEL_ROOT}/PxFoundation/include/PsBasicTemplates.h
    ${PEEL_ROOT}/PxFoundation/include/PsBitUtils.h
    ${PEEL_ROOT}/PxFoundation/include/PsBroadcast.h
    ${PEEL_ROOT}/PxFoundation/include/PsCpu.h
    ${PEEL_ROOT}/PxFoundation/include/PsFoundation.h
    ${PEEL_ROOT}/PxFoundation/include/PsFPU.h
    ${PEEL_ROOT}/PxFoundation/include/PsHash.h
    ${PEEL_ROOT}/PxFoundation/include/PsHashInternals.h
    ${PEEL_ROOT}/PxFoundation/include/PsHashMap.h
    ${PEEL_ROOT}/PxFoundation/include/PsHashSet.h
    ${PEEL_ROOT}/PxFoundation/include/PsInlineAllocator.h
    ${PEEL_ROOT}/PxFoundation/include/PsInlineAoS.h
    ${PEEL_ROOT}/PxFoundation/include/PsInlineArray.h
    ${PEEL_ROOT}/PxFoundation/include/PsIntrinsics.h
    ${PEEL_ROOT}/PxFoundation/include/PsMathUtils.h
    ${PEEL_ROOT}/PxFoundation/include/PsMutex.h
    ${PEEL_ROOT}/PxFoundation/include/PsPool.h
    ${PEEL_ROOT}/PxFoundation/include/PsSList.h
    ${PEEL_ROOT}/PxFoundation/include/PsSocket.h
    ${PEEL_ROOT}/PxFoundation/include/PsSort.h
    ${PEEL_ROOT}/PxFoundation/include/PsSortInternals.h
    ${PEEL_ROOT}/PxFoundation/include/PsString.h
    ${PEEL_ROOT}/PxFoundation/include/PsSync.h
    ${PEEL_ROOT}/PxFoundation/include/PsTempAllocator.h
    ${PEEL_ROOT}/PxFoundation/include/PsThread.h
    ${PEEL_ROOT}/PxFoundation/include/PsTime.h
    ${PEEL_ROOT}/PxFoundation/include/PsUserAllocated.h
    ${PEEL_ROOT}/PxFoundation/include/PsUtilities.h
    ${PEEL_ROOT}/PxFoundation/include/PsVecMath.h
    ${PEEL_ROOT}/PxFoundation/include/PsVecMathAoSScalar.h
    ${PEEL_ROOT}/PxFoundation/include/PsVecMathAoSScalarInline.h
    ${PEEL_ROOT}/PxFoundation/include/PsVecMathSSE.h
    ${PEEL_ROOT}/PxFoundation/include/PsVecMathUtilities.h
    ${PEEL_ROOT}/PxFoundation/include/PsVecQuat.h
    ${PEEL_ROOT}/PxFoundation/include/PsVecTransform.h
    ${PEEL_ROOT}/PxFoundation/include/windows/PsWindowsAoS.h
    ${PEEL_ROOT}/PxFoundation/include/windows/PsWindowsFPU.h
    ${PEEL_ROOT}/PxFoundation/include/windows/PsWindowsInclude.h
    ${PEEL_ROOT}/PxFoundation/include/windows/PsWindowsInlineAoS.h
    ${PEEL_ROOT}/PxFoundation/include/windows/PsWindowsIntrinsics.h
    ${PEEL_ROOT}/PxFoundation/include/windows/PsWindowsTrigConstants.h
    ${PEEL_ROOT}/PxFoundation/Px.h
    ${PEEL_ROOT}/PxFoundation/PxAllocatorCallback.h
    ${PEEL_ROOT}/PxFoundation/PxAssert.h
    ${PEEL_ROOT}/PxFoundation/PxBitAndData.h
    ${PEEL_ROOT}/PxFoundation/PxBounds3.h
    ${PEEL_ROOT}/PxFoundation/PxErrorCallback.h
    ${PEEL_ROOT}/PxFoundation/PxErrors.h
    ${PEEL_ROOT}/PxFoundation/PxFlags.h
    ${PEEL_ROOT}/PxFoundation/PxFoundation.h
    ${PEEL_ROOT}/PxFoundation/PxFoundationConfig.h
    ${PEEL_ROOT}/PxFoundation/PxIntrinsics.h
    ${PEEL_ROOT}/PxFoundation/PxIO.h
    ${PEEL_ROOT}/PxFoundation/PxMat33.h
    ${PEEL_ROOT}/PxFoundation/PxMat44.h
    ${PEEL_ROOT}/PxFoundation/PxMath.h
    ${PEEL_ROOT}/PxFoundation/PxMathUtils.h
    ${PEEL_ROOT}/PxFoundation/PxMemory.h
    ${PEEL_ROOT}/PxFoundation/PxPhysicsVersion.h
    ${PEEL_ROOT}/PxFoundation/PxPlane.h
    ${PEEL_ROOT}/PxFoundation/PxPreprocessor.h
    ${PEEL_ROOT}/PxFoundation/PxProfiler.h
    ${PEEL_ROOT}/PxFoundation/PxQuat.h
    ${PEEL_ROOT}/PxFoundation/PxSharedAssert.h
    ${PEEL_ROOT}/PxFoundation/PxSimpleTypes.h
    ${PEEL_ROOT}/PxFoundation/PxStrideIterator.h
    ${PEEL_ROOT}/PxFoundation/PxTransform.h
    ${PEEL_ROOT}/PxFoundation/PxUnionCast.h
    ${PEEL_ROOT}/PxFoundation/PxVec2.h
    ${PEEL_ROOT}/PxFoundation/PxVec3.h
    ${PEEL_ROOT}/PxFoundation/PxVec4.h
    # NONE ${PEEL_ROOT}/HACD/hacdCircularList.inl
    # NONE <${PEEL_ROOT}/HACD/hacdVector.inl
    # IMAGE ${PEEL_ROOT}/PEEL.ico
    # RESOURCE ${PEEL_ROOT}/PEEL.rc
    # CUSTOM ${PEEL_ROOT}/Fracture/Convex.h
    # CUSTOM ${PEEL_ROOT}/Fracture/Delaunay3d.h
    # CUSTOM ${PEEL_ROOT}/Fracture/FracturePattern.h
    # CUSTOM ${PEEL_ROOT}/PxFoundation.h
)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
	# Enable Precompiled Headers for PEEL
	set_source_files_properties(${PEEL_SRC_FILES} PROPERTIES COMPILE_FLAGS "/Yustdafx.h")
	set(PEEL_SRC_FILES ${PEEL_SRC_FILES} ${PEEL_ROOT}/stdafx.cpp)
	set_source_files_properties(${PEEL_ROOT}/stdafx.cpp PROPERTIES COMPILE_FLAGS "/Ycstdafx.h")
endif()

set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsFPU.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsMutex.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsPrintString.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsSocket.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsSList.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsThread.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsSync.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsTime.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/HACD/hacdGraph.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/HACD/hacdICHull.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/HACD/hacdHACD.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/HACD/hacdManifoldMesh.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/PsFoundation.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/PsAllocator.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/PsAssert.cp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/PsString.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/PsMathUtils.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/PsUtilities.cp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsAtomic.cp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsCpu.cp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/PsTempAllocator.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/PsAssert.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/PsUtilities.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsAtomic.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)
set_source_files_properties("${PEEL_ROOT}/PxFoundation/src/windows/PsWindowsCpu.cpp" PROPERTIES SKIP_PRECOMPILE_HEADERS ON)

# Group source files
source_group(TREE ${PEEL_REPO_ROOT} FILES ${PEEL_SRC_FILES})

# Create PEEL lib
add_executable(PEEL ${PEEL_SRC_FILES})

target_include_directories(PEEL PUBLIC "${PEEL_ROOT}")
target_include_directories(PEEL PUBLIC "${PEEL_ROOT}/Ice/APIs/Ice/#Plugins/FlexineSDK")
target_include_directories(PEEL PUBLIC "${PEEL_ROOT}/Ice/APIs/Ice")
target_include_directories(PEEL PUBLIC "${PEEL_ROOT}/HACD")
target_include_directories(PEEL PUBLIC "${PEEL_ROOT}/Glut/include")
target_include_directories(PEEL PUBLIC "${PEEL_ROOT}/DevIL/include")
target_include_directories(PEEL PUBLIC "${PEEL_ROOT}/PxFoundation")
target_include_directories(PEEL PUBLIC "${PEEL_ROOT}/PxFoundation/include")
target_include_directories(PEEL PUBLIC "${PEEL_ROOT}/")
target_include_directories(PEEL PUBLIC "${PEEL_REPO_ROOT}/Externals")
target_include_directories(PEEL PUBLIC "${PEEL_REPO_ROOT}/Private/NVD")

# Set the correct working directory
set_property(TARGET PEEL PROPERTY VS_DEBUGGER_WORKING_DIRECTORY "${PEEL_ROOT}")
