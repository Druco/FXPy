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
#define FXRGB(r,g,b)  (((FXuint)(FXuchar)(r)<<24) | ((FXuint)(FXuchar)(g)<<16) | ((FXuint)(FXuchar)(b)<<8) | 0x000000ff)

/// Clamp value x to range [lo..hi]
#define FXCLAMP(lo,x,hi) ((x)<(lo)?(lo):((x)>(hi)?(hi):(x)))

/// Return the maximum of a or b
#define FXMAX(a,b) (((a)>(b))?(a):(b))

/// Return the minimum of a or b
#define FXMIN(a,b) (((a)>(b))?(b):(a))

#define FX_PRINTF(fmt,arg) ;
#define FX_SCANF(fmt,arg) ;

#undef FXAPI
#define FXAPI
