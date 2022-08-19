@echo off

setlocal EnableDelayedExpansion EnableExtensions

if exist "%~dp0..\Build" rmdir /q /s "%~dp0..\Build"

call "%~dp0Build_PEEL.bat" Debug
if errorlevel 1 exit /b

call "%~dp0Build_PEEL.bat" Release
if errorlevel 1 exit /b

echo.
echo Success. All configs compiled successfully. Celebrate!
echo.
exit /b
