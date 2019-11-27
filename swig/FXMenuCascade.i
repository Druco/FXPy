/* FXMenuCascade.i */

%pythonappend FX::FXMenuCascade::FXMenuCascade %{
  self.thisown = False
%}
%pythonappend FX::FXPyMenuCascade::FXPyMenuCascade %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMenuCascade.h"

namespace FX {
class FXPyMenuCascade : public FXMenuCascade {
    FXDECLARE(FXPyMenuCascade)
public:
    FXPyMenuCascade(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXPopup* pup=NULL,FXuint opts=0);
};
}
