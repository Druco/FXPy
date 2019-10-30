/* FXCURCursor.i */

%pythonappend FX::FXCURCursor::FXCURCursor %{
  self.thisown = False
%}
%pythonappend FX::FXPyCURCursor::FXPyCURCursor %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXCURCursor.h"

namespace FX {
class FXPyCURCursor : public FXCURCursor {
public:
  FXCURCursor(FXApp* a,const void* pix);
};

}
