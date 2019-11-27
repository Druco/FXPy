/* FXId.i */

%pythonappend FX::FXId::FXId %{
  self.thisown = False
%}

%pythonappend FX::FXPyId::FXPyId %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXId.h"

namespace FX {
class FXPyId : public FXId {
    FXDECLARE(FXPyId)
protected:
    FXPyId();
};
}
