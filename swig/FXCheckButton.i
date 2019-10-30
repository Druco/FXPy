/* FXCheckButton.i */

%pythonappend FX::FXCheckButton::FXCheckButton %{
  self.thisown = False
%}
%pythonappend FX::FXPyCheckButton::FXPyCheckButton %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXCheckButton.h"

namespace FX {
class FXPyCheckButton : public FXCheckButton {
public:
  FXPyCheckButton(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=CHECKBUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

}
