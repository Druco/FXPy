/* FXXBMIcon.i */

%pythonappend FX::FXXBMIcon::FXXBMIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyXBMIcon::FXPyXBMIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXXBMIcon.h"

namespace FX {
class FXPyXBMIcon : public FXXBMIcon {
public:
    FXPyXBMIcon(FXApp* a,const FXuchar *pixels=NULL,const FXuchar *mask=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
