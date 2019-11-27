/* FXBitmap.i */

%pythonappend FX::FXBitmap::FXBitmap %{
  self.thisown = False
%}
%pythonappend FX::FXPyBitmap::FXPyBitmap %{
  self.thisown = False
  FXPyRegister(self)
%}

#define __GNUC__

%include "include/fxdefs2.h"
%include "include/FXBitmap.h"

namespace FX {
    class FXPyBitmap : public FXBitmap {
        FXDECLARE(FXPyBitmap)
    public:
        FXPyBitmap(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
  };

}
