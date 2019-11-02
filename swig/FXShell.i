/* FXShell.i */

%pythonappend FX::FXShell::FXShell %{
  self.thisown = False
%}
%pythonappend FX::FXPyShell::FXPyShell %{
  self.thisown = False
%}


%include "include/fxdefs2.h"
%include "include/FXShell.h"

namespace FX {
    class FXPyShell : public FXShell {
    protected:
        FXPyShell();
    };
}
