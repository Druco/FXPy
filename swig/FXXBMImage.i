/* FXXBMImage.i */

%pythonappend FX::FXXBMImage::FXXBMImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyXBMImage::FXPyXBMImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXXBMImage.h"

namespace FX {
class FXPyXBMImage : public FXXBMImage {
    FXDECLARE(FXPyXBMImage)
public:
    FXPyXBMImage(FXApp* a,const FXuchar *pixels=NULL,const FXuchar *mask=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
