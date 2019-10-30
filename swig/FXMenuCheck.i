/* FXMenuCheck.i */

%pythonappend FX::FXMenuCheck::FXMenuCheck %{
  self.thisown = False
%}
%pythonappend FX::FXPyMenuCheck::FXPyMenuCheck %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMenuCheck.h"

namespace FX {
class FXPyMenuCheck : public FXMenuCheck {
public:
    FXPyMenuCheck(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0);
};
}
