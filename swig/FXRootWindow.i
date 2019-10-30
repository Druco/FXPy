/* FXRootWindow.i */

%pythonappend FX::FXRootWindow::FXRootWindow %{
  self.thisown = False
%}
%pythonappend FX::FXPyRootWindow::FXPyRootWindow %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRootWindow.h"

namespace FX {
class FXPyRootWindow : public FXRootWindow {
public:
    FXPyRootWindow(FXApp* a,FXVisual *vis);
};
}
