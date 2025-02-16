
/* Copyright (c) 2011 Khaled Mamou (kmamou at gmail dot com)
 All rights reserved.


 Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

 1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

 2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

 3. The names of the contributors may not be used to endorse or promote products derived from this software without specific prior written permission.

 THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
#pragma once
#ifndef HACD_VECTOR_H
#define HACD_VECTOR_H
#include<math.h>
#include<iostream>
#include<hacdVersion.h>

namespace HACD
{
    typedef double Real;
	//!	Vector dim 3.
	template < typename T > class Vec3
	{
	public:
		T &					X();
		T &					Y();
		T &					Z();
		const T	&			X() const;
		const T	&			Y() const;
		const T	&			Z() const;
		void				Normalize();
		T					GetNorm() const;
		void				operator= (const Vec3 & rhs);
		void				operator+=(const Vec3 & rhs);
		void				operator-=(const Vec3 & rhs);
		void				operator-=(T a);
		void				operator+=(T a);
		void				operator/=(T a);
		void				operator*=(T a);
		Vec3				operator^ (const Vec3 & rhs) const;
		T			    	operator* (const Vec3 & rhs) const;
		Vec3				operator+ (const Vec3 & rhs) const;
		Vec3				operator- (const Vec3 & rhs) const;
		Vec3				operator- () const;
		Vec3				operator* (T rhs) const;
		Vec3				operator/ (T rhs) const;
							Vec3();
							Vec3(T a);
							Vec3(T x, T y, T z);
							Vec3(const Vec3 & rhs);
		/*virtual*/			~Vec3(void);

	private:
		T					m_data[3];
	};
    template<typename T>
    const bool Colinear(const Vec3<T> & a, const Vec3<T> & b, const Vec3<T> & c);
    template<typename T>
    const T Volume(const Vec3<T> & a, const Vec3<T> & b, const Vec3<T> & c, const Vec3<T> & d);

}
#include "hacdVector.inl"	// template implementation
#endif
