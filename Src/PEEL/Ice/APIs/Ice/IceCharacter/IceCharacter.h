///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *	Main file for IceCharacter.dll.
 *	\file		IceCharacter.h
 *	\author		Pierre Terdiman
 *	\date		May, 8, 2000
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Include Guard
#ifndef ICECHARACTER_H
#define ICECHARACTER_H

#include <IceCore/IcePreprocessor.h>

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Compilation messages
#if defined(ICECHARACTER_EXPORTS)
ICE_DIAG_MESSAGE("----Compiling ICE Character")
#elif !defined(ICECHARACTER_EXPORTS)
ICE_DIAG_MESSAGE("----Using ICE Character")
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Automatic linking
#	ifndef BAN_ICECHARACTER_AUTOLINK
#		ifdef _DEBUG
#			pragma comment(lib, "IceCharacter_D.lib")
#		else
#			pragma comment(lib, "IceCharacter.lib")
#		endif
#	endif
#endif

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Preprocessor

#ifndef ICE_NO_DLL
#	ifdef ICECHARACTER_EXPORTS
#		define ICECHARACTER_API __declspec(dllexport)
#	else
#		define ICECHARACTER_API __declspec(dllimport)
#	endif
#else
#	define ICECHARACTER_API
#endif

#include "IceCharacterSettings.h"

// Includes
namespace IceCharacter
{
#include "IceCharacterErrors.h"
#include "IceCharacterStudioNodes.h"
#include "IceBone.h"
#include "IceSkeletonDescriptor.h"
#include "IceCharacterMotion.h"

#include "IceMotionEvent.h"
#include "IceMotionTransition.h"
#include "IceMotionCell.h"
#include "IceMotionState.h"
#include "IceStateMachine.h"
#include "IceStateMachineCompiler.h"

#include "IceSkeleton.h"
#include "IceSkin.h"

#include "IceCharacterSerialize.h"

	// IK
#ifdef ICECHARACTER_INCLUDE_IKAN
#	include "trig.h"
#	include "myvec.h"
#	include "srs.h"
#endif

#include "IceCharacterAPI.h"
}

#endif  // ICECHARACTER_H
