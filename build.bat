@echo off

setlocal EnableDelayedExtensions

cd /d "%~dp0"
if exist "%~dp0Build" rmdir /q /s "%~dp0Build"

cmake -S . -B Build -G "Visual Studio 17 2022" -A x64
cmake --build Build
