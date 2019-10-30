/* FXPPMImage.i */

%pythonappend FX::FXPPMImage::FXPPMImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyPPMImage::FXPyPPMImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXPPMImage.h"

namespace FX {
class FXPyPPMImage : public FXPPMImage {
public:
    FXPyPPMImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
