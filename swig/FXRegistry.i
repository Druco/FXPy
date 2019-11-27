/* FXRegistry.i */

%pythonappend FX::FXRegistry::FXRegistry %{
  self.thisown = False
%}
%pythonappend FX::FXPyRegistry::FXPyRegistry %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRegistry.h"

namespace FX {
class FXPyRegistry : public FXRegistry {
    FXDECLARE(FXPyRegistry)
public:
    FXPyRegistry(const FXString& akey=FXString::null,const FXString& vkey=FXString::null);
};
}
