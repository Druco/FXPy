/* FXRASImage.i */

%pythonappend FX::FXRASImage::FXRASImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyRASImage::FXPyRASImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRASImage.h"

namespace FX {
class FXPyRASImage : public FXRASImage {
    FXDECLARE(FXPyRASImage)
public:
    FXPyRASImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
