/* FXScrollPane.i */

%pythonappend FX::FXScrollPane::FXScrollPane %{
  self.thisown = False
%}
%pythonappend FX::FXPyScrollPane::FXPyScrollPane %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXScrollPane.h"

namespace FX {
class FXPyScrollPane : public FXScrollPane {
public:
    FXPyScrollPane(FXWindow* owner,FXint nvis,FXuint opts=0);
};
}
