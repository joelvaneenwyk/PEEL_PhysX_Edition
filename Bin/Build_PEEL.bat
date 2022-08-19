@echo off

setlocal EnableDelayedExpansion EnableExtensions

call :Build "%~dp0..\" %*
if errorlevel 1 exit /b

exit /b 0

:Build
    setlocal EnableDelayedExpansion EnableExtensions

    set _root=%~dp1
    if %_root:~-1%==\ set _root=%_root:~0,-1%

    set _config=%~2
    if "%_config%"=="" set _config=Release

    set _build_path_relative=Build\x64-vs2022-%_config%

    if not "%~3"=="Clean" goto:$SkipCLean
    if exist "%_root%\%_build_path_relative%" rmdir /q /s "%_root%\%_build_path_relative%"
    :$SkipClean

    python "%_root%\Src\PEEL\#Compiler\BinaryToSource.py"

    set "_cmake_source=%_root:\=/%"
    set "_cmake_build=%_root%\%_build_path_relative%"
    set "_cmake_build=%_cmake_build:\=/%"

    call "%~dp0Run_CMake.bat" -S "%_cmake_source%" -B "%_cmake_build%" -G "Visual Studio 17 2022" -A x64
    if errorlevel 1 exit /b

    call "%~dp0Run_CMake.bat" --build "%_cmake_build%" --config %_config% --parallel 10
    if errorlevel 1 exit /b

    echo.
    echo Successfully built '!_config!' config. You have permission to rejoice.
    echo.
exit /b
