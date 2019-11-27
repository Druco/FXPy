/* FXICOImage.i */

%pythonappend FX::FXICOImage::FXICOImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyICOImage::FXPyICOImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXICOImage.h"

namespace FX {
class FXPyICOImage : public FXICOImage {
    FXDECLARE(FXPyICOImage)
public:
    FXPyICOImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
