/* FXToolBar.i */

%pythonappend FX::FXToolBar::FXToolBar %{
  self.thisown = False
%}
%pythonappend FX::FXPyToolBar::FXPyToolBar %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXToolBar.h"

namespace FX {
class FXPyToolBar : public FXToolBar {
public:
    FXPyToolBar(FXComposite* p,FXComposite* q,FXuint opts=LAYOUT_TOP|LAYOUT_LEFT|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
    FXPyToolBar(FXComposite* p,FXuint opts,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=2,FXint pr=3,FXint pt=3,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);

};
}
