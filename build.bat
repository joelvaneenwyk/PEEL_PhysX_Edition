@echo off

setlocal EnableDelayedExtensions

cd /d "%~dp0"
cmake -S Src -B Build
cmake --build Build
