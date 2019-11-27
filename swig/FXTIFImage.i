/* FXTIFImage.i */

%pythonappend FX::FXTIFImage::FXTIFImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyTIFImage::FXPyTIFImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTIFImage.h"

namespace FX {
class FXPyTIFImage : public FXTIFImage {
    FXDECLARE(FXPyTIFImage)
public:
    FXPyTIFImage(FXApp *a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
