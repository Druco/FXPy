/* FXGLContext.i */

%pythonappend FX::FXGLContext::FXGLContext %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLContext::FXPyGLContext %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLContext.h"

namespace FX {
class FXPyGLContext : public FXGLContext {
    FXDECLARE(FXPyGLContext)
public:
    FXPyGLContext(FXApp* a,FXGLVisual *vis);
    FXPyGLContext(FXApp* a,FXGLVisual *vis,FXGLContext *shared);
};
}
