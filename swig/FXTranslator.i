/* FXTranslator.i */

%pythonappend FX::FXTranslator::FXTranslator %{
  self.thisown = False
%}
%pythonappend FX::FXPyTranslator::FXPyTranslator %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTranslator.h"

namespace FX {
class FXPyTranslator : public FXTranslator {
    FXDECLARE(FXPyTranslator)
public:
    FXPyTranslator(FXApp* a);
};
}
