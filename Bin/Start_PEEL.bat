@echo off

setlocal EnableDelayedExpansion

call :FindPEEL
if not exist "%_peel%" (
    echo Failed to find compiled version of PEEL. Please compile first.
    exit /b 5
)

:$StartPEEL
"%_peel%" %*
exit /b

:FindPEEL
    if exist "%~dp0..\Build\x64-vs2022-release\Release" cd /d "%~dp0..\Build\x64-vs2022-release\Release"
    set _peel=%~dp0..\Build\x64-vs2022-release\Release\PEEL.exe
    if exist "%_peel%" goto:$Done

    if exist "%~dp0..\Build\x64-vs2022\Release" cd /d "%~dp0..\Build\x64-vs2022\Release"
    set _peel=%~dp0..\Build\x64-vs2022\Release\PEEL.exe
    if exist "%_peel%" goto:$Done

    :$Done
exit /b
