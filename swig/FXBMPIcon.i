/* FXBMPIcon.i */

%pythonappend FX::FXBMPIcon::FXBMPIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyBMPIcon::FXPyBMPIcon %{
  self.thisown = False
  FXPyRegister(self)
%}


#define __GNUC__
%include "include/fxdefs2.h"
%include "include/FXBMPIcon.h"

namespace FX {
class FXPyBMPIcon : public FX::FXBMPIcon {
public:
  static const FX::FXchar fileExt[];
  static const FX::FXchar mimeType[];
public:
  FXPyBMPIcon(FX::FXApp* a,const void *pix=NULL,FX::FXColor clr=FXRGB(192,192,192),FX::FXuint opts=0,FX::FXint w=1,FX::FXint h=1);
  };
}
