/* FXMemMap.i */

%pythonappend FX::FXMemMap::FXMemMap %{
  self.thisown = False
%}
%pythonappend FX::FXPyMemMap::FXPyMemMap %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXMemMap.h"

namespace FX {
class FXPyMemMap : public FXMemMap {
public:
    FXPyMemMap();
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
