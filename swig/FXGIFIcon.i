/* FXGIFIcon.i */

%pythonappend FX::FXGIFIcon::FXGIFIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyGIFIcon::FXPyGIFIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGIFIcon.h"

%include "pytypemaps.i"

namespace FX {
class FXPyGIFIcon : public FXGIFIcon {
    FXDECLARE(FXPyGIFIcon)
public:
    FXPyGIFIcon(FX::FXApp* a,const void *pix=NULL,FX::FXColor clr=FXRGB(192,192,192),FX::FXuint opts=0,FX::FXint w=1,FX::FXint h=1);
};
}
