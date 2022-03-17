@echo off

setlocal EnableDelayedExpansion

if exist "%~dp0\Externals\JoltPhysics\Build\VS2022_CL" rmdir /s /q "%~dp0\Externals\JoltPhysics\Build\VS2022_CL"
cd /d "%~dp0\Externals\JoltPhysics\Build"
call "%~dp0\Externals\JoltPhysics\Build\cmake_vs2022_cl.bat"

if exist "%~dp0\Externals\PhysX4\physx\compiler\vc17win64" rmdir /s /q "%~dp0\Externals\PhysX4\physx\compiler\vc17win64"
call "%~dp0\Externals\PhysX4\physx\generate_projects.bat" "vc17win64"
