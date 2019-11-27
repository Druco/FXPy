/* FXGLObject.i */

%pythonappend FX::FXGLObject::FXGLObject %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLObject::FXPyGLObject %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLObject.h"

namespace FX {
class FXPyGLObject : public FXGLObject {
    FXDECLARE(FXPyGLObject)
public:
    FXPyGLObject();
};
}
