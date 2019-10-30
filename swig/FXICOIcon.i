/* FXICOIcon.i */

%pythonappend FX::FXICOIcon::FXICOIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyICOIcon::FXPyICOIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXICOIcon.h"

namespace FX {
class FXPyICOIcon : public FXICOIcon {
public:
    FXICOIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
