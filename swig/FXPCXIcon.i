/* FXPCXIcon.i */

%pythonappend FX::FXPCXIcon::FXPCXIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyPCXIcon::FXPyPCXIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXPCXIcon.h"

namespace FX {
class FXPyPCXIcon : public FXPCXIcon {
    FXDECLARE(FXPyPCXIcon)
public:
    FXPyPCXIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
