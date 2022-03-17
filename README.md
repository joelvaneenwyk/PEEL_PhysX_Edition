# Physics Engine Evaluation Lab (PEEL)

![PEEL Logo](./Media/peel.jpg?raw=true)

PEEL was designed to evaluate, compare and benchmark physics engines. You can find the PEEL v1.1 repository at [Pierre-Terdiman/PEEL](https://github.com/Pierre-Terdiman/PEEL).

This version is based on PEEL v2.0 which was focused on NVIDIA PhysX and has been modified by [Joel Van Eenwyk](https://github.com/joelvaneenwyk) to make it easier to compile and get up and running. [PhysX 4](https://github.com/NVIDIAGameWorks/PhysX)
and [JoltPhysics](https://github.com/jrouwe/JoltPhysics) are both submodules that are compiled in as part of the main solution.

Windows is the only actively supported and tested platform and is built exclusively with Visual Studio 2022.

## Setup

1. Clone [joelvaneenwyk/PEEL](https://github.com/joelvaneenwyk/peel) and pull in submodules.
2. Run `setup.bat` in root to generate project files for Jolt Physics and NVIDIA PhysX.
3. Open `Src/#Compiler/PEEL.sln`
4. Compile either `Debug` or `Release` configurations and run `PEEL`.

For more information about how to use PEEL see [PEEL User Manual 1.1.pdf](./Docs/PEEL%20User%20Manual%201.1.pdf). Some of the information is outdated, but it is still a useful reference.

## Screenshots

### Dominoes

![Dominoes](./Media/Screenshots/Screenshot00.jpg?raw=true)

### CylinderStack

![CylinderStack](./Media/Screenshots/Screenshot01.jpg?raw=true)

### ThreeLegoGears

![ThreeLegoGears](./Media/Screenshots/Screenshot02.jpg?raw=true)

### SphericalJointNet

![SphericalJointNet](./Media/Screenshots/Screenshot03.jpg?raw=true)

### PortalScene2

![PortalScene2](./Media/Screenshots/Screenshot04.jpg?raw=true)

### ArticulatedChain_MCArticulation

![ArticulatedChain_MCArticulation](./Media/Screenshots/Screenshot05.jpg?raw=true)

### LegoExploding

![LegoExploding](./Media/Screenshots/Screenshot06.jpg?raw=true)

### ConvexGalore3

![ConvexGalore3](./Media/Screenshots/Screenshot07.jpg?raw=true)

### VoronoiFracture2

![VoronoiFracture2](./Media/Screenshots/Screenshot08.jpg?raw=true)

### VoronoiFracture5

![VoronoiFracture5](./Media/Screenshots/Screenshot09.jpg?raw=true)

### LegoSpeedChampions_DodgeChallenger

![LegoSpeedChampions_DodgeChallenger](./Media/Screenshots/Screenshot10.jpg?raw=true)

### LegoPolicePursuitTruck

![LegoPolicePursuitTruck](./Media/Screenshots/Screenshot11.jpg?raw=true)

### SceneConvexSweepVsStaticMeshes_TessBunny

![SceneConvexSweepVsStaticMeshes_TessBunny](./Media/Screenshots/Screenshot12.jpg?raw=true)

### LegoStaticMesh (1)

![LegoStaticMesh](./Media/Screenshots/Screenshot13.jpg?raw=true)

### LegoStaticMesh (2)

![LegoStaticMesh](./Media/Screenshots/Screenshot14.jpg?raw=true)

### SceneRaycastVsStaticMeshes_TessBunnyShort

![SceneRaycastVsStaticMeshes_TessBunnyShort](./Media/Screenshots/Screenshot15.jpg?raw=true)

### StaticMesh

![StaticMesh](./Media/Screenshots/Screenshot16.jpg?raw=true)

### CaterpillarTrack

![CaterpillarTrack](./Media/Screenshots/Screenshot17.jpg?raw=true)

### BulldozerTest

![BulldozerTest](./Media/Screenshots/Screenshot18.jpg?raw=true)

### ConvexCompoundChain

![ConvexCompoundChain](./Media/Screenshots/Screenshot19.jpg?raw=true)

### OverlapObjects_DynamicSpheres

![OverlapObjects_DynamicSpheres](./Media/Screenshots/Screenshot20.jpg?raw=true)
