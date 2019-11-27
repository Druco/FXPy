/* FXStatusBar.i */

%pythonappend FX::FXStatusBar::FXStatusBar %{
  self.thisown = False
%}
%pythonappend FX::FXPyStatusBar::FXPyStatusBar %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXStatusBar.h"

namespace FX {
class FXPyStatusBar : public FXStatusBar {
    FXDECLARE(FXPyStatusBar)
public:
    FXPyStatusBar(FXComposite* p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2,FXint hs=4,FXint vs=0);
};
}
