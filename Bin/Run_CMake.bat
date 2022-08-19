@echo off

setlocal EnableDelayedExpansion EnableExtensions

call :SetRoot "%~dp0..\"
call :CMake %*
exit /b

:SetRoot
    set _root=%~dp1
    if %_root:~-1%==\ set _root=%_root:~0,-1%
exit /b

:CMake
    setlocal EnableDelayedExpansion EnableExtensions

	set _cmake=%_root%\Externals\cmake\3.22.0\bin\cmake.exe
	if not exist "%_cmake%" set _cmake=cmake

	echo ##[cmd] "%_cmake%" %*
	"%_cmake%" %*
exit /b

:Start
