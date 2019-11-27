/* FXToolBarShell.i */

%pythonappend FX::FXToolBarShell::FXToolBarShell %{
  self.thisown = False
%}
%pythonappend FX::FXPyToolBarShell::FXPyToolBarShell %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXToolBarShell.h"

namespace FX {
class FXPyToolBarShell : public FXToolBarShell {
    FXDECLARE(FXPyToolBarShell)
public:
    FXPyToolBarShell(FXWindow* owner,FXuint opts=FRAME_RAISED|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint hs=4,FXint vs=4);
};
}
