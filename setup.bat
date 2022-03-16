@echo off

setlocal EnableDelayedExpansion

cd /d "%~dp0\PEEL_Externals\JoltPhysics\Build"
call "%~dp0\PEEL_Externals\JoltPhysics\Build\cmake_vs2022_cl.bat"
