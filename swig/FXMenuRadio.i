/* FXMenuRadio.i */

%pythonappend FX::FXMenuRadio::FXMenuRadio %{
  self.thisown = False
%}
%pythonappend FX::FXPyMenuRadio::FXPyMenuRadio %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMenuRadio.h"

namespace FX {
class FXPyMenuRadio : public FXMenuRadio {
public:
    FXPyMenuRadio(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0);
};
}
