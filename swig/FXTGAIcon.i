/* FXTGAIcon.i */

%pythonappend FX::FXTGAIcon::FXTGAIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyTGAIcon::FXPyTGAIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTGAIcon.h"

namespace FX {
class FXPyTGAIcon : public FXTGAIcon {
public:
    FXPyTGAIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
