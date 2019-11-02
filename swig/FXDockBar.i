/* FXDockBar.i */

%pythonappend FX::FXDockBar::FXDockBar %{
  self.thisown = False
%}
%pythonappend FX::FXPyDockBar::FXPyDockBar %{
  self.thisown = False
  FXPyRegister(self)
%}


%include "include/fxdefs2.h"
%include "include/FXDockBar.h"

namespace FX {

    class FXPyDockBar : public FXDockBar {
    public:
        FXPyDockBar(FXComposite* p,FXComposite* q,FXuint opts=LAYOUT_TOP|LAYOUT_LEFT|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
    FXPyDockBar(FXComposite* p,FXuint opts,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=2,FXint pr=3,FXint pt=3,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

}
