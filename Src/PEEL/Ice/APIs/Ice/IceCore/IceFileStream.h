///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *	Contains code for file streams.
 *	\file		IceFileStream.h
 *	\author		Pierre Terdiman
 *	\date		September, 13, 2004
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Include Guard
#ifndef ICEFILESTREAM_H
#define ICEFILESTREAM_H

	class ICECORE_API FileReadStream : public ReadStream
	{
		public:
												FileReadStream(const char* filename);
		virtual									~FileReadStream();

		inline_					bool			IsValid()								const	{ return mFp!=null;	}

		ICE_OVERRIDE(ReadStream)	bool			Seek(udword offset)						const;

		// Loading API
		ICE_OVERRIDE(ReadStream)	ubyte			ReadByte()								const;
		ICE_OVERRIDE(ReadStream)	uword			ReadWord()								const;
		ICE_OVERRIDE(ReadStream)	udword			ReadDword()								const;
		ICE_OVERRIDE(ReadStream)	float			ReadFloat()								const;
		ICE_OVERRIDE(ReadStream)	double			ReadDouble()							const;
		ICE_OVERRIDE(ReadStream)	bool			ReadBuffer(void* buffer, udword size)	const;

		private:
								FILE*			mFp;
	};

	class ICECORE_API FileWriteStream : public WriteStream
	{
		public:
												FileWriteStream(const char* filename);
		virtual									~FileWriteStream();

		inline_					bool			IsValid()								const	{ return mFp!=null;	}

		// Saving API
		ICE_OVERRIDE(WriteStream)	WriteStream&	StoreByte(ubyte b);
		ICE_OVERRIDE(WriteStream)	WriteStream&	StoreWord(uword w);
		ICE_OVERRIDE(WriteStream)	WriteStream&	StoreDword(udword d);
		ICE_OVERRIDE(WriteStream)	WriteStream&	StoreFloat(float f);
		ICE_OVERRIDE(WriteStream)	WriteStream&	StoreDouble(double f);
		ICE_OVERRIDE(WriteStream)	WriteStream&	StoreBuffer(const void* buffer, udword size);

		private:
								FILE*			mFp;
	};

#endif	// ICEFILESTREAM_H
