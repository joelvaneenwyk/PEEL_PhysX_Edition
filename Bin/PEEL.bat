@echo off

setlocal EnableDelayedExpansion

if exist "%~dp0..\Build\x64" cd /d "%~dp0..\Build\x64"
set _peel=%~dp0..\Build\x64\PEEL\PEEL.exe
if not exist "%_peel%" set _peel=%~dp0..\Build\x64\PEEL_DEBUG.exe
if exist "%_peel%" goto:$StartPEEL

if exist "%~dp0..\Build\Win32" cd /d "%~dp0..\Build\Win32"
if not exist "%_peel%" set _peel=%~dp0..\Build\Win32\PEEL.exe
if not exist "%_peel%" set _peel=%~dp0..\Build\Win32\PEEL_DEBUG.exe
if not exist "%_peel%" (
    echo Failed to find compiled version of PEEL. Please compile first.
    exit /b 5
)

:$StartPEEL
"%_peel%" %*
exit /b
