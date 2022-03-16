@echo off

setlocal EnableDelayedExpansion

cd /d "%~dp0\PEEL_Externals\JoltPhysics\Build"
call "%~dp0\PEEL_Externals\JoltPhysics\Build\cmake_vs2022_cl.bat"

call "%~dp0\PEEL_Externals\PhysX4\physx\generate_projects.bat" "vc17win64"
