/* FXRGBIcon.i */

%pythonappend FX::FXRGBIcon::FXRGBIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyRGBIcon::FXPyRGBIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRGBIcon.h"

namespace FX {
class FXPyRGBIcon : public FXRGBIcon {
public:
    FXPyRGBIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
