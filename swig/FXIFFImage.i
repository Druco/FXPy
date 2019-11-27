/* FXIFFImage.i */

%pythonappend FX::FXIFFImage::FXIFFImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyIFFImage::FXPyIFFImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXIFFImage.h"
namespace FX {
class FXPyIFFImage : public FXIFFImage {
    FXDECLARE(FXPyIFFImage)
public:
    FXPyIFFImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};
}
