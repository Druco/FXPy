/* FXToolTip.i */

%pythonappend FX::FXToolTip::FXToolTip %{
  self.thisown = False
%}
%pythonappend FX::FXPyToolTip::FXPyToolTip %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXToolTip.h"

namespace FX {
class FXPyToolTip : public FXToolTip {
public:
    FXPyToolTip(FXApp* a,FXuint opts=TOOLTIP_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
