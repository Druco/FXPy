/* FXRASIcon.i */

%pythonappend FX::FXRASIcon::FXRASIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyRASIcon::FXPyRASIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRASIcon.h"

namespace FX {
class FXPyRASIcon : public FXRASIcon {
    FXDECLARE(FXPyRASIcon)
public:
    FXPyRASIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
