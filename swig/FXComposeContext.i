/* FXComposeContext.i */

%pythonappend FX::FXComposeContext::FXComposeContext %{
  self.thisown = False
%}
%pythonappend FX::FXPyComposeContext::FXPyComposeContext %{
  self.thisown = False
  FXPyRegister(self)
%}


%include "include/fxdefs2.h"
%include "include/FXComposeContext.h"

namespace FX {
class FXPyComposeContext : public FXComposeContext {
  FXComposeContext(FXApp* a,FXWindow* win=NULL,FXSelector sel=0);
};

}
