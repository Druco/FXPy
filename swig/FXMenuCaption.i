/* FXMenuCaption.i */

%pythonappend FX::FXMenuCaption::FXMenuCaption %{
  self.thisown = False
%}
%pythonappend FX::FXPyMenuCaption::FXPyMenuCaption %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMenuCaption.h"

namespace FX {
class FXPyMenuCaption : public FXMenuCaption {
    FXDECLARE(FXPyMenuCaption)
public:
    FXPyMenuCaption(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXuint opts=0);
};
}
