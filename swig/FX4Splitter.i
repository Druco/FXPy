/* FX4Splitter.i */


#define __GNUC__
%module FX4Splitter

%{
#include "include/fxdefs.h"
#include "include/FXHash.h"
#include "include/FXObject.h"
#include "include/FXString.h"
#include "include/FX4Splitter.h"
%}

/// Macro to set up class declaration
#define FXDECLARE(classname) \
  public: \
   struct FXMapEntry { FX::FXSelector keylo; FX::FXSelector keyhi; long (classname::* func)(FX::FXObject*,FX::FXSelector,void*); }; \
   static const FX::FXMetaClass metaClass; \
   static FX::FXObject* manufacture(); \
   virtual long handle(FX::FXObject* sender,FX::FXSelector sel,void* ptr); \
   virtual const FX::FXMetaClass* getMetaClass() const { return &metaClass; } \
/*   friend FX::FXStream& operator<<(FX::FXStream& store,const classname* obj){return store.saveObject((FX::FXObjectPtr)(obj));}  */ \
/*   friend FX::FXStream& operator>>(FX::FXStream& store,classname*& obj){return store.loadObject((FX::FXObjectPtr&)(obj));}  */ \
  private:

%include "include/FX4Splitter.h"
