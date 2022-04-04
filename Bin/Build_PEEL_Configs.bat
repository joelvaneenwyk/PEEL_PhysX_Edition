@echo off

setlocal EnableDelayedExpansion EnableExtensions

call "%~dp0Build_PEEL.bat" Debug
if errorlevel 1 exit /b

call "%~dp0Build_PEEL.bat" Release
if errorlevel 1 exit /b

echo.
echo Success. You now have permission to rejoice.
echo.
exit /b
