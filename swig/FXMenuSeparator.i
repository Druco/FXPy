/* FXMenuSeparator.i */

%pythonappend FX::FXMenuSeparator::FXMenuSeparator %{
  self.thisown = False
%}
%pythonappend FX::FXPyMenuSeparator::FXPyMenuSeparator %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMenuSeparator.h"

namespace FX {
class FXPyMenuSeparator : public FXMenuSeparator {
public:
    FXPyMenuSeparator(FXComposite* p,FXuint opts=0);
};
}
