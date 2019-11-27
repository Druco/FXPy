/* FXDocument.i */

%pythonappend FX::FXDocument::FXDocument %{
  self.thisown = False
%}
%pythonappend FX::FXPyDocument::FXPyDocument %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXDocument.h"

namespace FX {
class FXPyDocument : public FXDocument {
    FXDECLARE(FXPyDocument)
public:
    FXPyDocument();
};
}
