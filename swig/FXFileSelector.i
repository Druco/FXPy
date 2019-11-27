/* FXFileSelector.i */

%pythonappend FX::FXFileSelector::FXFileSelector %{
  self.thisown = False
%}
%pythonappend FX::FXPyFileSelector::FXPyFileSelector %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXFileSelector.h"

namespace FX {
class FXPyFileSelector : public FXFileSelector {
    FXDECLARE(FXPyFileSelector)
public:
    FXPyFileSelector(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
