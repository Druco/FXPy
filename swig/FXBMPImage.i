/* FXBMPImage.i */

%pythonappend FX::FX::FX %{
  self.thisown = False
%}

%pythonappend FX::FXBMPImage::FXBMPImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyBMPImage::FXPyBMPImage %{
  self.thisown = False
  FXPyRegister(self)
%}


#define __GNUC__
%include "include/fxdefs2.h"
%include "include/FXBMPImage.h"

namespace FX {
class FXPyBMPImage : public FXBMPImage {
    FXDECLARE(FXPyBMPImage)
public:
  FXPyBMPImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
  };
}
