/* FXJPGIcon.i */

%pythonappend FX::FXJPGIcon::FXJPGIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyJPGIcon::FXPyJPGIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXJPGIcon.h"

namespace FX {
class FXPyJPGIcon : public FXJPGIcon {
    FXDECLARE(FXPyJPGIcon)
public:
    FXPyJPGIcon(FXApp *a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1,FXint q=75);
};
}
