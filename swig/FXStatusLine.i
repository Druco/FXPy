/* FXStatusLine.i */

%pythonappend FX::FXStatusLine::FXStatusLine %{
  self.thisown = False
%}
%pythonappend FX::FXPyStatusLine::FXPyStatusLine %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXStatusLine.h"

namespace FX {
class FXPyStatusLine : public FXStatusLine {
public:
    FXPyStatusLine(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0);
};
}
