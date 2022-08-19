///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/**
 *	Contains a void renderer.
 *	\file		IceVoidRenderer.h
 *	\author		Pierre Terdiman
 *	\date		January, 17, 2000
 */
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Precompiled Header
#include "StdAfx.h"

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
// Include Guard
#ifndef ICEVOIDRENDERER_H
#define ICEVOIDRENDERER_H

#ifdef OBSOLETE_RENDERER
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 *	Creates & returns the global void renderer.
	 *	\fn			CreateVoidRenderer()
	 *	\return		the global void renderer.
	 */
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	FUNCTION ICERENDERER_API Renderer* CreateVoidRenderer();

	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	/**
	 *	Releases the global void renderer.
	 *	\fn			ReleaseVoidRenderer()
	 */
	///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	FUNCTION ICERENDERER_API void ReleaseVoidRenderer();
#endif

	class ICERENDERER_API VoidRenderState : public RenderStateManager
	{
		public:
												VoidRenderState();
												~VoidRenderState();

		ICE_OVERRIDE(RenderStateManager)	bool	ValidateDevice(udword& nbpasses)						{ return true;	}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Transformations
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetWorldMatrix(const Matrix4x4& world)					{ return TRUE;	}
		ICE_OVERRIDE(RenderStateManager)	void	GetWorldMatrix(Matrix4x4& world)						{}

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetBoneMatrix(udword i, const Matrix4x4& world)			{ return TRUE;	}
		ICE_OVERRIDE(RenderStateManager)	void	GetBoneMatrix(udword i, Matrix4x4& world)				{}

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetViewMatrix(const Matrix4x4& view)					{ return TRUE;	}
		ICE_OVERRIDE(RenderStateManager)	void	GetViewMatrix(Matrix4x4& view)							{}

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetProjMatrix(const Matrix4x4& proj)					{ return TRUE;	}
		ICE_OVERRIDE(RenderStateManager)	void	GetProjMatrix(Matrix4x4& proj)							{}

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureMatrix(udword i, const Matrix4x4& texture)	{ return TRUE;	}
		ICE_OVERRIDE(RenderStateManager)	void	GetTextureMatrix(udword i, Matrix4x4& texture)			{}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Helper methods
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(RenderStateManager)	void	SetDepthRange				(float zmin, float zmax)	{}
		ICE_OVERRIDE(RenderStateManager)	void	SetColorUpdate				(BOOL flag)					{}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// User-defined clipping planes
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(RenderStateManager)	udword	MaxUserClippingPlanes()									{ return 0;		}
		ICE_OVERRIDE(RenderStateManager)	udword	MaxHardwareUserClippingPlanes()							{ return 0;		}
		ICE_OVERRIDE(RenderStateManager)	void	EnableClipPlane(udword mask)							{}
		ICE_OVERRIDE(RenderStateManager)	void	SetClipPlane(udword i, float* equation)					{}
		ICE_OVERRIDE(RenderStateManager)	void	GetClipPlane(udword i, float* equation)					{}
		ICE_OVERRIDE(RenderStateManager)	udword	AddClipPlane(const Plane& clipplane)					{ return 0;		}
		ICE_OVERRIDE(RenderStateManager)	bool	RemoveClipPlane(udword planeid)							{ return true;	}
		protected:
		ICE_OVERRIDE(RenderStateManager)	void	ValidateClipPlanes()									{}

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// State block manager
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		private:

		ICE_OVERRIDE(RenderStateManager)	bool	BeginStateBlock()										{ return true; }
		ICE_OVERRIDE(RenderStateManager)	bool	EndStateBlock(udword& id)								{ return true; }
		ICE_OVERRIDE(RenderStateManager)	bool	ApplyStateBlock(udword blockid)							{ return true; }
		ICE_OVERRIDE(RenderStateManager)	bool	DeleteStateBlock(udword blockid)						{ return true; }

		public:
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Flag-controlled render states
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTexturePerspective		(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetZWrite					(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetAlphaTest				(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetDithering				(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetAlphaBlending			(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetFog						(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetSpecular					(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetStencilTest				(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetLighting					(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetLastPixel				(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetStippledAlpha			(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetEdgeAntialias			(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetColorKeyMode				(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetColorKeyBlendMode		(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetRangeBasedFog			(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetClipping					(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetScreenExtents			(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetColorVertex				(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPerspSpecHigh			(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetNormalize				(BOOL flag)					{ return TRUE; }

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetSoftwareVertexProcessing	(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPointSprite				(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPointScale				(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetMultiSampleAntialias		(BOOL flag)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetIndexedVertexBlend		(BOOL flag)					{ return TRUE; }

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Dword-controlled render states
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetAmbientColor				(udword ambcolor)			{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetAntialiasMode			(ANTIALIASMODE am)			{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetZBufferMode				(ZBUFFERMODE zm)			{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetZBufferCmpMode			(CMPFUNC cf)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetZBias					(udword value)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetLinePattern				(udword value)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetAlphaRef					(udword ref)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetAlphaFunc				(CMPFUNC af)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetSrcBlend					(ALPHABLEND mode)			{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetDstBlend					(ALPHABLEND mode)			{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetDiffuseMaterialSource	(MCS type)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetSpecularMaterialSource	(MCS type)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetAmbientMaterialSource	(MCS type)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetEmissiveMaterialSource	(MCS type)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetVertexBlend				(VBLEND mode)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureFactor			(udword value)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetFillMode					(FILLMODE fm)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetShadeMode				(SHADEMODE sm)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetCullMode					(CULLMODE cm)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetStencilRef				(udword val)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetStencilCmpMode			(CMPFUNC cf)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetStencilCmpMask			(udword mask)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetStencilWriteMask			(udword mask)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetStencilFailOp			(STENCILOP sop)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetStencilZFailOp			(STENCILOP sop)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetStencilPassOp			(STENCILOP sop)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetFogVertexMode			(FOGMODE mode)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetFogMode					(FOGMODE fm)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetFogDensity				(float density)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetFogColor					(udword fogcolor)			{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetFogStart					(float fogstart)			{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetFogEnd					(float fogend)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetMaterialProps			(const MaterialProps* props){ return TRUE; }

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPointSize				(float size)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPointSizeMin				(float minsize)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPointScaleA				(float scalea)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPointScaleB				(float scaleb)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPointScaleC				(float scalec)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetMultiSampleMask			(udword mask)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPatchEdgeStyle			(PATCHEDGESTYLE pes)		{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPatchSegments			(float nb)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetPointSizeMax				(float maxsize)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetColorWriteEnable			(udword mask)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTweenFactor				(float factor)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetBlendOp					(BLENDOP op)				{ return TRUE; }

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		// Texture Render States
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureBitmap			(udword i, void* bitmap)			{ return TRUE; }

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureColorOp			(udword i, STAGEOP op)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureColorArg1			(udword i, STAGEARG sa)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureColorArg2			(udword i, STAGEARG sa)				{ return TRUE; }

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureAlphaOp			(udword i, STAGEOP op)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureAlphaArg1			(udword i, STAGEARG sa)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureAlphaArg2			(udword i, STAGEARG sa)				{ return TRUE; }

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureMinFilter			(udword i, TEXTUREMINFILTER tmf)	{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureMagFilter			(udword i, TEXTUREMAGFILTER tmf)	{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureMipFilter			(udword i, TEXTUREMIPFILTER tmf)	{ return TRUE; }

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureCoordIndex		(udword i, STAGETEXCOORDINDEX ci)	{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureTransFlags		(udword i, TEXTURETRANSFLAGS ttff)	{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureMipMapLODBias		(udword i, float bias)				{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureMaxMipMapLevel	(udword i, udword maxlevel)			{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureMaxAnisotropy		(udword i, udword maxanis)			{ return TRUE; }

		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureAddress			(udword i, TEXTUREADDRESS ta)		{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureAddressU			(udword i, TEXTUREADDRESS ta)		{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureAddressV			(udword i, TEXTUREADDRESS ta)		{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureBorder			(udword i, udword color)			{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureWrapU				(udword i, BOOL b)					{ return TRUE; }
		ICE_OVERRIDE(RenderStateManager)	BOOL	SetTextureWrapV				(udword i, BOOL b)					{ return TRUE; }
	};

	class ICERENDERER_API VoidRenderer : public Renderer
	{
		private:
											VoidRenderer();
		virtual								~VoidRenderer();

		public:
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Initializes the renderer.
		 *	\param		create		[in] creation structure
		 *	\return		true if success
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	bool			Initialize(const RENDERERCREATE& create);

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Presents the frame on the front buffer.
		 *	\return		true if success
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	bool			ShowFrame();

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Move callback.
		 *	\param		x	[in] x position on screen
		 *	\param		y	[in] y position on screen
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	void			OnMove(udword x, udword y);

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Renderer validation.
		 *	\return		true if the renderer is ready
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	bool			IsReady();

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Selects a viewport.
		 *	\param		vp		[in] viewport to select
		 *	\return		true if success
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	bool			SetViewport(const Viewport& vp);

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Clears a viewport.
		 *	\param		vp		[in] viewport to clear
		 *	\return		true if success
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	bool			ClearViewport(const Viewport& vp);

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Begins a scene. Use one BeginScene/EndScene for each viewport.
		 *	\see		EndScene()
		 *	\return		true if success
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	bool			BeginScene();

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Ends a scene.
		 *	\see		BeginScene()
		 *	\return		true if success
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	bool			EndScene();

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Resize callback.
		 *	\return		true if success
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	bool			Resize();

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Retrieves the scan-line that is currently being drawn on the monitor.
		 *	\return		the scanline number or -1 if failed
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	udword			GetScanline();

		// Primitive rendering
		ICE_OVERRIDE(Renderer)	bool			DrawPrimitive			(PrimType type, VertexFormat fvf, const void* verts, udword nbvertices, udword flags=0);
		ICE_OVERRIDE(Renderer)	bool			DrawIndexedPrimitive	(PrimType type, VertexFormat fvf, const void* verts, udword nbvertices, const uword* indices, udword nbindices, udword flags=0);
		// Vertex buffer rendering
		ICE_OVERRIDE(Renderer)	bool			DrawPrimitiveVB			(PrimType type, VertexBuffer* vb, udword startvertex, udword nbvertices, udword flags=0);
		ICE_OVERRIDE(Renderer)	bool			DrawIndexedPrimitiveVB	(PrimType type, VertexBuffer* vb, udword startvertex, udword nbvertices, const uword* indices, udword nbindices, udword flags=0);
		// ...
		ICE_OVERRIDE(Renderer)	bool			DrawIndexedPrimitive	(VertexBuffer* vb, const VBDesc& desc, IndexBuffer* ib, udword subset);

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Gets the general renderer caps. Don't take the caps as granted! you're supposed to check them before using any of them!
		 *	\return		true if success
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	bool			GetCaps();

		// Vertex buffers
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Creates a vertex buffer.
		 *	\param		create	[in] vertex buffer creation structure
		 *	\return		the newly created vertex buffer, or null if failed
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	VertexBuffer*	CreateVertexBuffer(const VERTEXBUFFERCREATE& create);

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Optimizes a vertex buffer.
		 *	\param		vb	[in] vertex buffer pointer
		 *	\return		Self-Reference
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	Renderer&		OptimizeVertexBuffer(VertexBuffer* vb);

		// Textures

		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		/**
		 *	Creates a texture.
		 *	\param		create	[in] texture creation structure
		 *	\return		the newly created texture, or null if failed
		 */
		///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		ICE_OVERRIDE(Renderer)	Texture*		CreateTexture(const TEXTURECREATE& create);

		// Lighting
		ICE_OVERRIDE(Renderer)	bool			SetupLightProps(Light* light);
		ICE_OVERRIDE(Renderer)	bool			SwitchLight(Light* light, bool enable);

		ICE_OVERRIDE(Renderer)	bool			Print(udword x, udword y, const char* text);

		// Render targets
		ICE_OVERRIDE(Renderer)	bool			SetRenderTarget(RenderTarget* target);

		private:

		friend ICERENDERER_API Renderer*	CreateVoidRenderer();
		friend ICERENDERER_API void			ReleaseVoidRenderer();
	};

#endif // ICEVOIDRENDERER_H
