/* FXGLVisual.i */

%pythonappend FX::FXGLVisual::FXGLVisual %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLVisual::FXPyGLVisual %{
  self.thisown = False
  FXPyRegister(self)
%}

%{
#include "FXGLVisual.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGLVisual.h"

namespace FX {
class FXPyGLVisual : public FXGLVisual {
    FXDECLARE(FXPyGLVisual)
public:
    FXPyGLVisual(FXApp* a,FXuint flags);
};
}
