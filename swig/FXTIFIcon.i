/* FXTIFIcon.i */

%pythonappend FX::FXTIFIcon::FXTIFIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyTIFIcon::FXPyTIFIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTIFIcon.h"

namespace FX {
class FXPyTIFIcon : public FXTIFIcon {
    FXDECLARE(FXPyTIFIcon)
public:
    FXPyTIFIcon(FXApp *a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
