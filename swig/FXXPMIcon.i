/* FXXPMIcon.i */

%pythonappend FX::FXXPMIcon::FXXPMIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyXPMIcon::FXPyXPMIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXXPMIcon.h"

namespace FX {
class FXPyXPMIcon : public FXXPMIcon {
    FXDECLARE(FXPyXPMIcon)
public:
    FXPyXPMIcon(FXApp* a,const FXchar **pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
