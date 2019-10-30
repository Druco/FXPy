/* FXJPGImage.i */

%pythonappend FX::FXJPGImage::FXJPGImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyJPGImage::FXPyJPGImage %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXJPGImage.h"

namespace FX {
class FXPyJPGImage : public FXJPGImage {
public:
    FXPyJPGImage(FXApp *a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1,FXint q=75);
};
}
