/* FXWindow.i */

%pythonappend FX::FXWindow::FXWindow %{
  self.thisown = False
%}
%pythonappend FX::FXPyWindow::FXPyWindow %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXWindow.h"

namespace FX {
class FXPyWindow : public FXWindow {
public:
    FXPyWindow(FXComposite* p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
