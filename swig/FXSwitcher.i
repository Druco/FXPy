/* FXSwitcher.i */

%pythonappend FX::FXSwitcher::FXSwitcher %{
  self.thisown = False
%}
%pythonappend FX::FXPySwitcher::FXPySwitcher %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXSwitcher.h"

namespace FX {
class FXPySwitcher : public FXSwitcher {
public:
    FXPySwitcher(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING);
};
}
