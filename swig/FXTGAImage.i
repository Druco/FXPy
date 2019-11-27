/* FXTGAImage.i */

%pythonappend FX::FXTGAImage::FXTGAImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyTGAImage::FXPyTGAImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTGAImage.h"

namespace FX {
class FXPyTGAImage : public FXTGAImage {
    FXDECLARE(FXPyTGAImage)
public:
    FXPyTGAImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
