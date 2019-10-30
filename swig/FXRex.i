/* FXRex.i */

%pythonappend FX::FXRex::FXRex %{
  self.thisown = False
%}
%pythonappend FX::FXPyRex::FXPyRex %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRex.h"

namespace FX {
class FXPyRex : public FXRex {
public:
    FXPyRex();
    FXPyRex(const FXRex& orig);
    FXPyRex(const FXchar* pattern,FXint mode=REX_NORMAL,FXRexError* error=NULL);
    FXPyRex(const FXString& pattern,FXint mode=REX_NORMAL,FXRexError* error=NULL);

};
}
