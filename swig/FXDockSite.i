/* FXDockSite.i */

%pythonappend FX::FXDockSite::FXDockSite %{
  self.thisown = False
%}
%pythonappend FX::FXPyDockSite::FXPyDockSite %{
  self.thisown = False
  FXPyRegister(self)
%}


%include "include/fxdefs2.h"
%include "include/FXDockSite.h"

namespace FX {
class FXPyDockSite : public FXDockSite {
    FXDECLARE(FXPyDockSite)
public:
    FXPyDockSite(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0,FXint hs=0,FXint vs=0);
};

}
