cmake_minimum_required(VERSION 3.21 FATAL_ERROR)

project(PEEL LANGUAGES CXX)

# Set repository root
set(PEEL_SOURCE_ROOT ${PROJECT_SOURCE_DIR}/Src)
set(PEEL_REPO_ROOT ${PROJECT_SOURCE_DIR})

macro(set_option option value)
	set(${option} ${value} CACHE BOOL "" FORCE)
endmacro()

# Select X86 processor features to use (if everything is off it will be SSE4.1 compatible)
set_option(USE_SSE4_2 ON)
set_option(USE_AVX ON)
set_option(USE_AVX2 ON)
set_option(USE_LZCNT ON)
set_option(USE_TZCNT ON)
set_option(USE_F16C ON)
set_option(USE_FMADD ON)

set(CMAKE_CXX_STANDARD 17)

if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
	set(CMAKE_CONFIGURATION_TYPES "Debug;Release;Distribution")
elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang" OR "${CMAKE_CXX_COMPILER_ID}" STREQUAL "AppleClang")
	set(CMAKE_CONFIGURATION_TYPES "Debug;Release;ReleaseASAN;ReleaseUBSAN;ReleaseCoverage;Distribution")
endif()

if ("${CMAKE_SYSTEM_NAME}" STREQUAL "Windows")
	# Fill in the path to the asan libraries
	set(CLANG_LIB_PATH "\"$(VSInstallDir)\\VC\\Tools\\Llvm\\x64\\lib\\clang\\${CMAKE_CXX_COMPILER_VERSION}\\lib\\windows\"")

	# 64 bit architecture
	set(CMAKE_VS_PLATFORM_TOOLSET_HOST_ARCHITECTURE "x64")

	# Set runtime library
	set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")

	# Set general compiler flags
	set(CMAKE_CXX_FLAGS "/Zc:__cplusplus /GR- /Gm- /nologo /diagnostics:classic /FC /fp:except- /Zc:inline /Zi /DWIN32 /D_WINDOWS /DUNICODE /D_UNICODE")

	# Set compiler flags for various configurations
	set(CMAKE_CXX_FLAGS_DEBUG "/D_DEBUG /GS /Od /Ob0 /RTC1 /DJPH_PROFILE_ENABLED /DJPH_DEBUG_RENDERER")
	set(CMAKE_CXX_FLAGS_RELEASE "/DNDEBUG /GS- /GL /Gy /O2 /Oi /Ot /DJPH_PROFILE_ENABLED /DJPH_DEBUG_RENDERER")
	set(CMAKE_CXX_FLAGS_DISTRIBUTION "/DNDEBUG /GS- /GL /Gy /O2 /Oi /Ot")
	set(CMAKE_CXX_FLAGS_RELEASEASAN "/DNDEBUG /DJPH_PROFILE_ENABLED /DJPH_DISABLE_TEMP_ALLOCATOR /DJPH_DEBUG_RENDERER -fsanitize=address /Od")
	set(CMAKE_CXX_FLAGS_RELEASEUBSAN "/DNDEBUG /DJPH_PROFILE_ENABLED /DJPH_DEBUG_RENDERER -fsanitize=undefined,implicit-conversion")
	set(CMAKE_CXX_FLAGS_RELEASECOVERAGE "/DNDEBUG -fprofile-instr-generate -fcoverage-mapping")

	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /D_CONSOLE")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /DGLUT_NO_LIB_PRAGMA")
	set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /DPX_PHYSX_STATIC_LIB")

	# Set linker flags
	set(CMAKE_EXE_LINKER_FLAGS "/machine:x64 /SUBSYSTEM:WINDOWS /ignore:4221 /DEBUG:FASTLINK")
	if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "MSVC")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /MP /fp:fast") # Clang doesn't use fast math because it cannot be turned off inside a single compilation unit
		if (USE_AVX2)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /arch:AVX2")
		elseif (USE_AVX)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /arch:AVX")
		endif()
		if (USE_SSE4_2)
			add_compile_definitions(JPH_USE_SSE4_2)
		endif()
		if (USE_LZCNT)
			add_compile_definitions(JPH_USE_LZCNT)
		endif()
		if (USE_TZCNT)
			add_compile_definitions(JPH_USE_TZCNT)
		endif()
		if (USE_F16C)
			add_compile_definitions(JPH_USE_F16C)
		endif()
		if (USE_FMADD)
			add_compile_definitions(JPH_USE_FMADD)
		endif()
		set(CMAKE_CXX_FLAGS_DEBUG "${CMAKE_CXX_FLAGS_DEBUG} /DJPH_FLOATING_POINT_EXCEPTIONS_ENABLED") # Clang turns Float2 into a vector sometimes causing floating point exceptions
		set(CMAKE_CXX_FLAGS_RELEASE "${CMAKE_CXX_FLAGS_RELEASE} /DJPH_FLOATING_POINT_EXCEPTIONS_ENABLED")
		set(CMAKE_EXE_LINKER_FLAGS_RELEASE "/INCREMENTAL:NO /LTCG:incremental /OPT:ICF /OPT:REF")
		set(CMAKE_STATIC_LINKER_FLAGS_RELEASE "/LTCG")
	elseif ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "Clang")
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /showFilenames")
		if (USE_AVX2)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mavx2 -mbmi -mpopcnt -mlzcnt -mf16c -mfma")
		elseif (USE_AVX)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mavx -mpopcnt")
		elseif (USE_SSE4_2)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.2 -mpopcnt")
		else()
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1")
		endif()
		if (USE_LZCNT)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mlzcnt")
		endif()
		if (USE_TZCNT)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mbmi")
		endif()
		if (USE_F16C)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mf16c")
		endif()
		if (USE_FMADD)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mfma")
		endif()
		set(CMAKE_EXE_LINKER_FLAGS_RELEASEASAN "/SUBSYSTEM:CONSOLE /LIBPATH:${CLANG_LIB_PATH} clang_rt.asan-x86_64.lib -wholearchive:clang_rt.asan-x86_64.lib clang_rt.asan_cxx-x86_64.lib -wholearchive:clang_rt.asan_cxx-x86_64.lib")
		set(CMAKE_EXE_LINKER_FLAGS_RELEASEUBSAN "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /LIBPATH:${CLANG_LIB_PATH}")
		set(CMAKE_EXE_LINKER_FLAGS_RELEASECOVERAGE "${CMAKE_EXE_LINKER_FLAGS_RELEASE} /LIBPATH:${CLANG_LIB_PATH}")
	endif()
elseif ("${CMAKE_SYSTEM_NAME}" STREQUAL "Linux" OR "${CMAKE_SYSTEM_NAME}" STREQUAL "Darwin" OR "${CMAKE_SYSTEM_NAME}" STREQUAL "iOS")
	# Set general compiler flags (do not use -ffast-math since it cannot be turned off in a single compilation unit)
	set(CMAKE_CXX_FLAGS "-g -I. -Wall -Werror")

	if ("${CMAKE_CXX_COMPILER_ID}" STREQUAL "GNU")
		# Somehow -Wcomment doesn't want to be turned off from code and we need this because Doxygen MathJax uses it
		# Also turn off automatic fused multiply add contractions, there doesn't seem to be a way to do this selectively through the macro JPH_PRECISE_MATH_OFF
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wno-comment -ffp-contract=off")
	endif()

	# Platform specific compiler flags
	if ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "x86_64" OR "${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "AMD64")
		# X64
		if (USE_AVX2)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mavx2 -mbmi -mpopcnt -mlzcnt -mf16c -mfma")
		elseif (USE_AVX)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mavx -mpopcnt")
		elseif (USE_SSE4_2)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.2 -mpopcnt")
		else()
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -msse4.1")
		endif()
		if (USE_LZCNT)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mlzcnt")
		endif()
		if (USE_TZCNT)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mbmi")
		endif()
		if (USE_F16C)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mf16c")
		endif()
		if (USE_FMADD)
			set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -mfma")
		endif()
	elseif ("${CMAKE_SYSTEM_PROCESSOR}" STREQUAL "aarch64")
		# ARM64
		set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
	endif()

	# Set compiler flags for various configurations
	set(CMAKE_CXX_FLAGS_DEBUG "-D_DEBUG -DJPH_PROFILE_ENABLED -DJPH_DEBUG_RENDERER") # Clang reorders variables so that div by zero occurs if we enable exception checking
	set(CMAKE_CXX_FLAGS_RELEASE "-O3 -DNDEBUG -DJPH_PROFILE_ENABLED -DJPH_DEBUG_RENDERER")
	set(CMAKE_CXX_FLAGS_DISTRIBUTION "-O3 -DNDEBUG")
	set(CMAKE_CXX_FLAGS_RELEASEASAN "-DNDEBUG -DJPH_PROFILE_ENABLED -DJPH_DISABLE_TEMP_ALLOCATOR -DJPH_DEBUG_RENDERER -fsanitize=address")
	set(CMAKE_CXX_FLAGS_RELEASEUBSAN "-DNDEBUG -DJPH_PROFILE_ENABLED -DJPH_DEBUG_RENDERER -fsanitize=undefined,implicit-conversion")
	set(CMAKE_CXX_FLAGS_RELEASECOVERAGE "-DNDEBUG -fprofile-instr-generate -fcoverage-mapping")

	# Set linker flags
	set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -pthread")
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
include("${PEEL_SOURCE_ROOT}/#Compiler/PEEL.cmake")

#
# Plugins
#

include("${PEEL_SOURCE_ROOT}/PINT_Skeleton/#Compiler/PINT_Skeleton.cmake")
include("${PEEL_SOURCE_ROOT}/PINT_Jolt/#Compiler/PINT_Jolt.cmake")
include("${PEEL_SOURCE_ROOT}/PINT_PhysX4/#Compiler/PINT_PhysX4.cmake")
