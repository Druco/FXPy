/* FXGIFCursor.i */

%pythonappend FX::FXGIFCursor::FXGIFCursor %{
  self.thisown = False
%}
%pythonappend FX::FXPyGIFCursor::FXPyGIFCursor %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGIFCursor.h"

namespace FX {
class FXPyGIFCursor : public FXGIFCursor {
    FXDECLARE(FXPyGIFCursor)
public:
    FXPyGIFCursor(FXApp* a,const void* pix,FXint hx=0,FXint hy=0);
};
}
