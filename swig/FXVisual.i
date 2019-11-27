/* FXVisual.i */

%pythonappend FX::FXVisual::FXVisual %{
  self.thisown = False
%}
%pythonappend FX::FXPyVisual::FXPyVisual %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXVisual.h"

namespace FX {
class FXPyVisual : public FXVisual {
    FXDECLARE(FXPyVisual)
public:
    FXPyVisual(FXApp* a,FXuint flgs,FXuint d=32);
};
}
