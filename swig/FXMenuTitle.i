/* FXMenuTitle.i */

%pythonappend FX::FXMenuTitle::FXMenuTitle %{
  self.thisown = False
%}
%pythonappend FX::FXPyMenuTitle::FXPyMenuTitle %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMenuTitle.h"

namespace FX {
class FXPyMenuTitle : public FXMenuTitle {
    FXDECLARE(FXPyMenuTitle)
public:
    FXPyMenuTitle(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXPopup* pup=NULL,FXuint opts=0);
};
}
