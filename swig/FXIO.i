/* FXIO.i */

%pythonappend FX::FXIO::FXIO %{
  self.thisown = False
%}
%pythonappend FX::FXPyIO::FXPyIO %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXIO.h"

namespace FX {
class FXPyIO : public FXIO {
public:
    FXPyIO();
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
