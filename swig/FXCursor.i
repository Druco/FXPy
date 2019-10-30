/* FXCursor.i */

%pythonappend FX::FXCursor::FXCursor %{
  self.thisown = False
%}
%pythonappend FX::FXPyCursor::FXPyCursor %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXCursor.h"

namespace FX {
class FXPyCursor : public FXCursor {
public:
  FXPyCursor(FXApp* a,FXStockCursor curid=CURSOR_ARROW);

  FXPyCursor(FXApp* a,const FXuchar* src,const FXuchar* msk,FXint w=32,FXint h=32,FXint hx=0,FXint hy=0);

  FXPyCursor(FXApp* a,const FXColor* pix,FXint w=32,FXint h=32,FXint hx=0,FXint hy=0);
};

}
