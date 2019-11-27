/* FXDirSelector.i */

%pythonappend FX::FXDirSelector::FXDirSelector %{
  self.thisown = False
%}
%pythonappend FX::FXPyDirSelector::FXPyDirSelector %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXDirSelector.h"

namespace FX {
class FXPyDirSelector : public FXDirSelector {
    FXDECLARE(FXPyDirSelector)
public:
    FXPyDirSelector(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

}
