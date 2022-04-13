cmake_minimum_required(VERSION 3.21 FATAL_ERROR)

project(PEEL LANGUAGES CXX)

# Set repository root
set(PEEL_SOURCE_ROOT ${PROJECT_SOURCE_DIR}/Src)
set(PEEL_APPLICATION_ROOT ${PROJECT_SOURCE_DIR}/Src/PEEL)
set(PEEL_REPO_ROOT ${PROJECT_SOURCE_DIR})

macro(set_option option value)
	set(${option} ${value} CACHE BOOL "" FORCE)
endmacro()

# Select X86 processor features to use (if everything is off it will be SSE4.1 compatible)
set_option(USE_SSE4_2 	ON)
set_option(USE_AVX 		ON)
set_option(USE_AVX2 	ON)
set_option(USE_LZCNT 	ON)
set_option(USE_TZCNT 	ON)
set_option(USE_F16C 	ON)
set_option(USE_FMADD 	ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_INSTALL_PREFIX ${PEEL_REPO_ROOT}/Build/Install)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
	set(CMAKE_CONFIGURATION_TYPES "Debug;Release;ReleaseASAN;ReleaseUBSAN;ReleaseCoverage;Distribution")
else()
	set(CMAKE_CONFIGURATION_TYPES "Debug;Release;Distribution")
endif()

if ("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
	# Set runtime library
	set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>DLL")

	add_definitions(-DWIN32 -D_WINDOWS -D_WIN32)

	if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
		# Set general compiler flags
		set(CMAKE_CXX_FLAGS "/Zc:__cplusplus /GR- /Gm- /nologo /diagnostics:classic /FC /fp:except- /Zc:inline /Zi")

		# Set compiler flags for various configurations
		set(CMAKE_CXX_FLAGS_DEBUG "/D_DEBUG /GS /Od /Ob0 /RTC1")
		set(CMAKE_CXX_FLAGS_RELEASE "/DNDEBUG /GS- /GL /Gy /O2 /Oi /OtR")
		set(CMAKE_CXX_FLAGS_DISTRIBUTION "/DNDEBUG /GS- /GL /Gy /O2 /Oi /Ot")
		set(CMAKE_CXX_FLAGS_RELEASEASAN "/DNDEBUG -fsanitize=address /Od")
		set(CMAKE_CXX_FLAGS_RELEASEUBSAN "/DNDEBUG -fsanitize=undefined,implicit-conversion")
		set(CMAKE_CXX_FLAGS_RELEASECOVERAGE "/DNDEBUG -fprofile-instr-generate -fcoverage-mapping")
	endif()

	# Set linker flags
	set(CMAKE_EXE_LINKER_FLAGS "/machine:x64 /SUBSYSTEM:WINDOWS /ignore:4221 /DEBUG:FASTLINK")

	if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP /fp:fast") # Clang doesn't use fast math because it cannot be turned off inside a single compilation unit
		if (USE_AVX2)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /arch:AVX2")
		elseif (USE_AVX)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /arch:AVX")
		endif()

		# Clang turns Float2 into a vector sometimes causing floating point exceptions
		set(CMAKE_EXE_LINKER_FLAGS_RELEASE "/INCREMENTAL:NO /LTCG:incremental /OPT:ICF /OPT:REF")
		set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "/LTCG")
	endif()
endif()

# Set linker flags
set(CMAKE_EXE_LINKER_FLAGS_DISTRIBUTION "${CMAKE_EXE_LINKER_FLAGS_RELEASE}")
set(CMAKE_SHARED_LINKER_FLAGS_DISTRIBUTION "${CMAKE_EXE_LINKER_FLAGS_RELEASE}")

if(CMAKE_SIZEOF_VOID_P EQUAL 8)
	set(PEEL_BIN_DIR_NAME x64)
	set(PEEL_BIN_ARCH 64)
else()
	set(PEEL_BIN_DIR_NAME Win32)
	set(PEEL_BIN_ARCH 32)
endif()

# Make PEEL executable
include("${PEEL_SOURCE_ROOT}/PEEL/#Compiler/PEEL.cmake")

#
# Plugins
#

include("${PEEL_SOURCE_ROOT}/PINT_Skeleton/#Compiler/PINT_Skeleton.cmake")
include("${PEEL_SOURCE_ROOT}/PINT_Jolt/#Compiler/PINT_Jolt.cmake")
include("${PEEL_SOURCE_ROOT}/PINT_PhysX4/#Compiler/PINT_PhysX4.cmake")
