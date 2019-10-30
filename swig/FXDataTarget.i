/* FXDataTarget.i */

%pythonappend FX::FXDataTarget::FXDataTarget %{
  self.thisown = False
%}
%pythonappend FX::FXPyDataTarget::FXPyDataTarget %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXDataTarget.h"

namespace FX {
class FXPyDataTarget : public FXDataTarget {
private:
  // Associated integer value (if it's an integer)
  FXint intValue;

  // Associated double value (if it's a float)
  FXdouble doubleValue;

  // Associated string value (if it's a string)
  FXString stringValue;

  // Associated boolean value (if it's a boolean)
  FXbool boolValue;

public:

  FXPyDataTarget():target(NULL),data(NULL),message(0),type(DT_VOID){}
#if 0
  FXPyDataTarget(FXObject* tgt,FXSelector sel):target(tgt),data(NULL),message(sel),type(DT_VOID){}
  FXPyDataTarget(FXchar& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_CHAR){}
  FXPyDataTarget(FXuchar& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_UCHAR){}
  FXPyDataTarget(FXshort& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_SHORT){}
  FXPyDataTarget(FXushort& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_USHORT){}
  FXPyDataTarget(FXint& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_INT){}
  FXPyDataTarget(FXuint& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_UINT){}
  FXPyDataTarget(FXlong& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_LONG){}
  FXPyDataTarget(FXulong& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_ULONG){}
  FXPyDataTarget(FXfloat& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_FLOAT){}
  FXPyDataTarget(FXdouble& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_DOUBLE){}
  FXPyDataTarget(FXString& value,FXObject* tgt=NULL,FXSelector sel=0):target(tgt),data(&value),message(sel),type(DT_STRING){}
#endif
  %extend {
      // extern FXPyDataTarget(PyObject*, FXSelector=0);
  }
};

}
