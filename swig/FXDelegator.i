/* FXDelegator.i */

%pythonappend FX::FXDelegator::FXDelegator %{
  self.thisown = False
%}
%pythonappend FX::FXPyDelegator::FXPyDelegator %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXDelegator.h"

namespace FX {
class FXPyDelegator : public FXDelegator {
public:
    FXPyDelegator(FXObject* target=NULL);
};

}
