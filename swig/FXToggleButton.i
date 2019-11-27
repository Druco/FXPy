/* FXToggleButton.i */

%pythonappend FX::FXToggleButton::FXToggleButton %{
  self.thisown = False
%}
%pythonappend FX::FXPyToggleButton::FXPyToggleButton %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXToggleButton.h"

namespace FX {
class FXPyToggleButton : public FXToggleButton {
    FXDECLARE(FXPyToggleButton)
public:
    FXPyToggleButton(FXComposite* p,const FXString& text1,const FXString& text2,FXIcon* icon1=NULL,FXIcon* icon2=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TOGGLEBUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
