/* FXXPMImage.i */

%pythonappend FX::FXXPMImage::FXXPMImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyXPMImage::FXPyXPMImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXXPMImage.h"

namespace FX {
class FXPyXPMImage : public FXXPMImage {
public:
    FXPyXPMImage(FXApp* a,const FXchar **pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
