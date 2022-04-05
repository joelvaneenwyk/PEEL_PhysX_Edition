@echo off

setlocal EnableDelayedExpansion EnableExtensions

call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"

python "%~dp0..\Src\#Compiler\BinaryToSource.py"

set _config=%~1
if "%_config%"=="" set _config=Release

call :Build %_config%
if errorlevel 1 exit /b

echo.
echo Successfully built '%_config%' config. You have permission to rejoice.
echo.
exit /b 0

:Build
    cd /d "%~dp0..\"
    cmake -S . -B Build\x64-vs2022 -G "Visual Studio 17 2022" -A x64
    if errorlevel 1 exit /b

    cmake --build Build\x64-vs2022 --config %~1 --parallel 10
exit /b
