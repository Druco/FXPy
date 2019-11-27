/* FXIFFIcon.i */

%pythonappend FX::FXIFFIcon::FXIFFIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyIFFIcon::FXPyIFFIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXIFFIcon.h"
namespace FX {
class FXPyIFFIcon : public FXIFFIcon {
    FXDECLARE(FXPyIFFIcon)
public:
    FXPyIFFIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
