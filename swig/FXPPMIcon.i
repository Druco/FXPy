/* FXPPMIcon.i */

%pythonappend FX::FXPPMIcon::FXPPMIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyPPMIcon::FXPyPPMIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXPPMIcon.h"

namespace FX {
class FXPyPPMIcon : public FXPPMIcon {
    FXDECLARE(FXPyPPMIcon)
public:
    FXPyPPMIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
