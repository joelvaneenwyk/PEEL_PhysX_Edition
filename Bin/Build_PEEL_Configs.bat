@echo off

setlocal EnableDelayedExpansion EnableExtensions

call "%~dp0Build_PEEL.bat" Debug Clean
if errorlevel 1 exit /b

call "%~dp0Build_PEEL.bat" Release Clean
if errorlevel 1 exit /b

echo.
echo Success. All configs compiled successfully. Celebrate!
echo.
exit /b
