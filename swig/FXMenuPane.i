/* FXMenuPane.i */

%pythonappend FX::FXMenuPane::FXMenuPane %{
  self.thisown = False
%}
%pythonappend FX::FXPyMenuPane::FXPyMenuPane %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMenuPane.h"

namespace FX {
class FXPyMenuPane : public FXMenuPane {
public:
    FXPyMenuPane(FXWindow* owner,FXuint opts=0);
};
}
