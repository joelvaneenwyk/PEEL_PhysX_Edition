@echo off

setlocal EnableDelayedExpansion

if exist "%~dp0..\Build\x64\Release" cd /d "%~dp0..\Build\x64\Release"
set _peel=%~dp0..\Build\x64\Release\PEEL.exe
if exist "%_peel%" goto:$StartPEEL

if exist "%~dp0..\Build\x64\Debug" cd /d "%~dp0..\Build\x64\Debug"
set _peel=%~dp0..\Build\x64\Debug\PEEL_DEBUG.exe
if exist "%_peel%" goto:$StartPEEL

if exist "%~dp0..\Build\Win32\Release" cd /d "%~dp0..\Build\Win32\Release"
set _peel=%~dp0..\Build\Win32\Release\PEEL.exe
if exist "%_peel%" goto:$StartPEEL

if exist "%~dp0..\Build\Win32\Debug" cd /d "%~dp0..\Build\Win32\Debug"
set _peel=%~dp0..\Build\Win32\Debug\PEEL_DEBUG.exe
if exist "%_peel%" goto:$StartPEEL

if not exist "%_peel%" (
    echo Failed to find compiled version of PEEL. Please compile first.
    exit /b 5
)

:$StartPEEL
"%_peel%" %*
exit /b
