/* FXRGBImage.i */

%pythonappend FX::FXRGBImage::FXRGBImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyRGBImage::FXPyRGBImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRGBImage.h"

namespace FX {
class FXPyRGBImage : public FXRGBImage {
public:
    FXPyRGBImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
