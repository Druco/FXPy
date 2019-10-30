/* FXRadioButton.i */

%pythonappend FX::FXRadioButton::FXRadioButton %{
  self.thisown = False
%}
%pythonappend FX::FXPyRadioButton::FXPyRadioButton %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRadioButton.h"

namespace FX {
class FXPyRadioButton : public FXRadioButton {
public:
    FXPyRadioButton(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=RADIOBUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
