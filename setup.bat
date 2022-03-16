@echo off

setlocal EnableDelayedExpansion

cd /d "%~dp0\Externals\JoltPhysics\Build"
call "%~dp0\Externals\JoltPhysics\Build\Win32\cmake_vs2022_cl.bat"

call "%~dp0\Externals\PhysX4\physx\generate_projects.bat" "vc17win64"
