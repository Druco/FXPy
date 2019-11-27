/* FXObjectList.i */

%pythonappend FX::FXObjectList::FXObjectList %{
  self.thisown = False
%}
%pythonappend FX::FXPyObjectList::FXPyObjectList %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXObjectList.h"
%template(FXGLObjectList) FX::FXObjectListOf<FXGLObject>;

namespace FX {
    FXDECLARE(FXPyRegister)
class FXPyObjectList : public FXObjectList {
public:
    FXPyObjectList(FXObject* object);
    FXPyObjectList(FXObject** objects,FXint n);
};
}
