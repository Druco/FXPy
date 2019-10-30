/* FXDrawable.i */

%pythonappend FX::FXDrawable::FXDrawable %{
  self.thisown = False
%}
%pythonappend FX::FXPyDrawable::FXPyDrawable %{
  self.thisown = False
  FXPyRegister(self)
%}


%include "include/fxdefs2.h"
%include "include/FXDrawable.h"

namespace FX {
class FXPyDrawable : public FXDrawable {
public:
    FXPyDrawable();
    FXPyDrawable(FXApp* a,FXint w,FXint h);
};
}
