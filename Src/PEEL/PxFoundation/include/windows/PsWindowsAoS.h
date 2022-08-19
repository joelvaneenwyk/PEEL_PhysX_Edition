// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions
// are met:
//  * Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//  * Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in the
//    documentation and/or other materials provided with the distribution.
//  * Neither the name of NVIDIA CORPORATION nor the names of its
//    contributors may be used to endorse or promote products derived
//    from this software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS ``AS IS'' AND ANY
// EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
// IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
// PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT OWNER OR
// CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
// EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
// PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
// PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
// OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
// Copyright (c) 2008-2019 NVIDIA Corporation. All rights reserved.
// Copyright (c) 2004-2008 AGEIA Technologies, Inc. All rights reserved.
// Copyright (c) 2001-2004 NovodeX AG. All rights reserved.

#ifndef PSFOUNDATION_PSWINDOWSAOS_H
#define PSFOUNDATION_PSWINDOWSAOS_H

// no includes here! this file should be included from PxcVecMath.h only!!!

#include <cinttypes>

#if !COMPILE_VECTOR_INTRINSICS
#error Vector intrinsics should not be included when using scalar implementation.
#endif

namespace physx
{
namespace shdfnd
{
namespace aos
{

#	if defined(__clang__)

	union QuadUnionM128
	{
		QuadUnionM128() : m128_vecf() { }
		QuadUnionM128(__m128 v) : m128_vecf(v) { }
		QuadUnionM128(__m128i v) : m128_veci(v) { }
		QuadUnionM128(__m128d v) : m128_vecd(v) { }
		__m128   m128_vecf;
		__m128i  m128_veci;
		__m128d  m128_vecd;
		float    m128_f32[4];
		double   m128d_f64[2];
		int8_t   m128_i8[16];
		int16_t  m128_i16[8];
		int32_t  m128_i32[4];
		int64_t  m128_i64[2];
		uint8_t  m128_u8[16];
		uint16_t m128_u16[8];
		uint32_t m128_u32[4];
		uint64_t m128_u64[2];
		int8_t   m128i_i8[16];
		int16_t  m128i_i16[8];
		int32_t  m128i_i32[4];
		int64_t  m128i_i64[2];
		uint8_t  m128i_u8[16];
		uint16_t m128i_u16[8];
		uint32_t m128i_u32[4];
		uint64_t m128i_u64[2];

		operator __m128() const { return m128_vecf; }
	};

	typedef QuadUnionM128 FloatV;
	typedef QuadUnionM128 Vec3V;
	typedef QuadUnionM128 Vec4V;
	typedef QuadUnionM128 BoolV;
	typedef QuadUnionM128 VecU32V;
	typedef QuadUnionM128 VecI32V;
	typedef QuadUnionM128 VecU16V;
	typedef QuadUnionM128 VecI16V;
	typedef QuadUnionM128 QuatV;
#else
	typedef __m128 FloatV;
typedef __m128 Vec3V;
typedef __m128 Vec4V;
typedef __m128 BoolV;
typedef __m128 VecU32V;
typedef __m128 VecI32V;
typedef __m128 VecU16V;
typedef __m128 VecI16V;
typedef __m128 QuatV;
#endif

#define FloatVArg FloatV &
#define Vec3VArg Vec3V &
#define Vec4VArg Vec4V &
#define BoolVArg BoolV &
#define VecU32VArg VecU32V &
#define VecI32VArg VecI32V &
#define VecU16VArg VecU16V &
#define VecI16VArg VecI16V &
#define QuatVArg QuatV &

// Optimization for situations in which you cross product multiple vectors with the same vector.
// Avoids 2X shuffles per product
struct VecCrossV
{
	Vec3V mL1;
	Vec3V mR1;
};

struct VecShiftV
{
	VecI32V shift;
};
#define VecShiftVArg VecShiftV &

PX_ALIGN_PREFIX(16)
struct Mat33V
{
	Mat33V()
	{
	}
	Mat33V(const Vec3V& c0, const Vec3V& c1, const Vec3V& c2) : col0(c0), col1(c1), col2(c2)
	{
	}
	Vec3V PX_ALIGN(16, col0);
	Vec3V PX_ALIGN(16, col1);
	Vec3V PX_ALIGN(16, col2);
} PX_ALIGN_SUFFIX(16);

PX_ALIGN_PREFIX(16)
struct Mat34V
{
	Mat34V()
	{
	}
	Mat34V(const Vec3V& c0, const Vec3V& c1, const Vec3V& c2, const Vec3V& c3) : col0(c0), col1(c1), col2(c2), col3(c3)
	{
	}
	Vec3V PX_ALIGN(16, col0);
	Vec3V PX_ALIGN(16, col1);
	Vec3V PX_ALIGN(16, col2);
	Vec3V PX_ALIGN(16, col3);
} PX_ALIGN_SUFFIX(16);

PX_ALIGN_PREFIX(16)
struct Mat43V
{
	Mat43V()
	{
	}
	Mat43V(const Vec4V& c0, const Vec4V& c1, const Vec4V& c2) : col0(c0), col1(c1), col2(c2)
	{
	}
	Vec4V PX_ALIGN(16, col0);
	Vec4V PX_ALIGN(16, col1);
	Vec4V PX_ALIGN(16, col2);
} PX_ALIGN_SUFFIX(16);

PX_ALIGN_PREFIX(16)
struct Mat44V
{
	Mat44V()
	{
	}
	Mat44V(const Vec4V& c0, const Vec4V& c1, const Vec4V& c2, const Vec4V& c3) : col0(c0), col1(c1), col2(c2), col3(c3)
	{
	}
	Vec4V PX_ALIGN(16, col0);
	Vec4V PX_ALIGN(16, col1);
	Vec4V PX_ALIGN(16, col2);
	Vec4V PX_ALIGN(16, col3);
} PX_ALIGN_SUFFIX(16);

} // namespace aos
} // namespace shdfnd
} // namespace physx

#endif // PSFOUNDATION_PSWINDOWSAOS_H
