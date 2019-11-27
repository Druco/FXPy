/* FXScrollWindow.i */

%pythonappend FX::FXScrollWindow::FXScrollWindow %{
  self.thisown = False
%}
%pythonappend FX::FXPyScrollWindow::FXPyScrollWindow %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXScrollWindow.h"


namespace FX {
class FXPyScrollWindow : public FXScrollWindow {
    FXDECLARE(FXPyScrollWindow)
public:
    FXPyScrollWindow(FXComposite* p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
