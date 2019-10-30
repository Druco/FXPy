#ifndef FXDEFS2_H_INCLUDED
#define FXDEFS2_H_INCLUDED

/// Macro to set up class declaration
#define FXDECLARE(classname) \
  public: \
   struct FXMapEntry { FXSelector keylo; FXSelector keyhi; long (classname::* func)(FXObject*,FXSelector,void*); }; \
   static const FXMetaClass metaClass; \
   static FXObject* manufacture(); \
   virtual long handle(FXObject* sender,FXSelector sel,void* ptr); \
   virtual const FXMetaClass* getMetaClass() const { return &metaClass; } \
/*   friend FXStream& operator<<(FXStream& store,const classname* obj){return store.saveObject((FXObjectPtr)(obj));} */ \
/*   friend FXStream& operator>>(FXStream& store,classname*& obj){return store.loadObject((FXObjectPtr&)(obj));} */ \
  private:

/// Macro to set up abstract class declaration
#define FXDECLARE_ABSTRACT(classname) \
  public: \
   struct FXMapEntry { FXSelector keylo; FXSelector keyhi; long (classname::* func)(FXObject*,FXSelector,void*); }; \
   static const FXMetaClass metaClass; \
   virtual long handle(FXObject* sender,FXSelector sel,void* ptr); \
   virtual const FXMetaClass* getMetaClass() const { return &metaClass; } \
/*   friend FXStream& operator<<(FXStream& store,const classname* obj){return store.saveObject((FXObjectPtr)(obj));} */ \
/*   friend FXStream& operator>>(FXStream& store,classname*& obj){return store.loadObject((FXObjectPtr&)(obj));} */ \
  private:


/// Make RGB color
#ifndef FXRGB
#define FXRGB(r,g,b)  (((FXuint)(FXuchar)(r)<<24) | ((FXuint)(FXuchar)(g)<<16) | ((FXuint)(FXuchar)(b)<<8) | 0x000000ff)
#endif

#ifndef FXRGBA
#define FXRGBA(r,g,b,a)    (((FXuint)(FXuchar)(r)<<24) | ((FXuint)(FXuchar)(g)<<16) | ((FXuint)(FXuchar)(b)<<8) | ((FXuint)(FXuchar)(a)))
#endif

/// Get red value from RGBA color
#ifndef FXREDVAL
#define FXREDVAL(rgba)     ((FXuchar)(((rgba)>>24)&0xff))
#endif

/// Get green value from RGBA color
#ifndef FXGREENVAL
#define FXGREENVAL(rgba)   ((FXuchar)(((rgba)>>16)&0xff))
#endif

/// Get blue value from RGBA color
#ifndef FXBLUEVAL
#define FXBLUEVAL(rgba)    ((FXuchar)(((rgba)>>8)&0xff))
#endif

/// Get alpha value from RGBA color
#ifndef FXALPHAVAL
#define FXALPHAVAL(rgba)   ((FXuchar)((rgba)&0xff))
#endif

/// Get component value of RGBA color
#ifndef FXRGBACOMPVAL
#define FXRGBACOMPVAL(rgba,comp) ((FXuchar)(((rgba)>>((3-(comp))<<3))&0xff))
#endif

/// Clamp value x to range [lo..hi]
#define FXCLAMP(lo,x,hi) ((x)<(lo)?(lo):((x)>(hi)?(hi):(x)))

/// Return the maximum of a or b
#define FXMAX(a,b) (((a)>(b))?(a):(b))

/// Return the minimum of a or b
#define FXMIN(a,b) (((a)>(b))?(b):(a))

#undef FX_PRINTF
#define FX_PRINTF(fmt,arg) ;
#undef FX_SCANF
#define FX_SCANF(fmt,arg) ;

#undef FXAPI
#define FXAPI

#endif
