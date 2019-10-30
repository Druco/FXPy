/* FXTriStateButton.i */

%pythonappend FX::FXTriStateButton::FXTriStateButton %{
  self.thisown = False
%}
%pythonappend FX::FXPyTriStateButton::FXPyTriStateButton %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTriStateButton.h"

namespace FX {
class FXPyTriStateButton : public FXTriStateButton {
public:
    FXPyTriStateButton(FXComposite* p,const FXString& text1,const FXString& text2,const FXString& text3,FXIcon* icon1=NULL,FXIcon* icon2=NULL,FXIcon* icon3=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TOGGLEBUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
