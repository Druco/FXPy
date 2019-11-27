/* FXPCXImage.i */

%pythonappend FX::FXPCXImage::FXPCXImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyPCXImage::FXPyPCXImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXPCXImage.h"

namespace FX {
class FXPyPCXImage : public FXPCXImage {
    FXDECLARE(FXPyPCXImage)
public:
    FXPyPCXImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
