/* FXGradientBar.i */

%pythonappend FX::FXGradientBar::FXGradientBar %{
  self.thisown = False
%}
%pythonappend FX::FXPyGradientBar::FXPyGradientBar %{
  self.thisown = False
  FXPyRegister(self)
%}

%ignore lower;
%ignore middle;
%ignore upper;
%ignore lowerColor;
%ignore upperColor;
%ignore blend;
%ignore FXGradient;

%include "include/fxdefs2.h"
%include "include/FXGradientBar.h"

namespace FX {
class FXPyGradientBar : public FXGradientBar {
public:
    FXPyGradientBar(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
