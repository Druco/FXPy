/* FXPNGImage.i */

%pythonappend FX::FXPNGImage::FXPNGImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyPNGImage::FXPyPNGImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXPNGImage.h"

namespace FX {
class FXPyPNGImage : public FXPNGImage {
    FXDECLARE(FXPyPNGImage)
public:
    FXPyPNGImage(FXApp *a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
