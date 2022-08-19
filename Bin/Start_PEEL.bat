@echo off

setlocal EnableDelayedExpansion

call :FindPEEL "%~dp0..\"

if not exist "%_peel%" (
    echo Failed to find compiled version of PEEL. Please compile first.
    exit /b 5
)

call :StartPEEL %*
exit /b

:FindPEEL
    set _root=%~dp1
    if %_root:~-1%==\ set _root=%_root:~0,-1%

    set _peel=%_root%\Build\x64-vs2022-Release\Release\PEEL.exe
    if exist "%_peel%" goto:$Done

    set _peel=%_root%\Build\x64-vs2022\Release\PEEL.exe
    if exist "%_peel%" goto:$Done

    :$Done
    call :SetPEEL "%_peel%"
exit /b

:SetPEEL
    set _peel_dir=%~dp1
    set _peel=%~1
exit /b

:StartPEEL
    cd /d "%_peel_dir%"
    echo ##[cmd] "%_peel%" %*
    call "%_peel%" %*
exit /b
