/* FXStringDict.i */

%pythonappend FX::FXStringDict::FXStringDict %{
  self.thisown = False
%}
%pythonappend FX::FXPyStringDict::FXPyStringDict %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXStringDict.h"

namespace FX {
class FXPyStringDict : public FXStringDict {
    FXDECLARE(FXPyStringDict)
public:
    FXPyStringDict();
};
}
