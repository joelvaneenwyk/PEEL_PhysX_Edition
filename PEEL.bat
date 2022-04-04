@echo off

setlocal EnableDelayedExpansion

call "%~dp0Bin\Build_PEEL.bat"
if errorlevel 1 exit /b

call "%~dp0Bin\Start_PEEL.bat" -p "PINT_PhysX4.dll" %*
exit /b
