@echo off

setlocal EnableExtensions

cd /d "%~dp0"

call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"

call :Build Debug
if errorlevel 1 exit /b

call :Build Release
if errorlevel 1 exit /b

echo.
echo Success. You now have permission to rejoice.
echo.
exit /b

:Build
    call :Clean
    if errorlevel 1 exit /b

    cmake -S . -B Build\x64_vs2022 -G "Visual Studio 17 2022" -A x64
    if errorlevel 1 exit /b

    msbuild Build\x64_vs2022\PEEL.sln /property:Configuration=%~1

    ::cmake --build Build\x64_vs2022 --config %~1
exit /b

:Clean
    if exist "%~dp0Build" rmdir /q /s "%~dp0Build"
    if exist "%~dp0Externals\JoltPhysics\Build\VS2022_CL" rmdir /q /s "%~dp0Externals\JoltPhysics\Build\VS2022_CL"
    if exist "%~dp0Externals\PhysX4\physx\bin\win.x86_64.vc143.mt" rmdir /q /s "%~dp0Externals\PhysX4\physx\bin\win.x86_64.vc143.mt"
    if exist "%~dp0Externals\PhysX4\physx\bin\win.x86_64.vc143.mt" rmdir /q /s "%~dp0Externals\PhysX4\physx\bin\win.x86_64.vc143.mt"
exit /b
