/* FXMenuButton.i */

%pythonappend FX::FXMenuButton::FXMenuButton %{
  self.thisown = False
%}
%pythonappend FX::FXPyMenuButton::FXPyMenuButton %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMenuButton.h"

namespace FX {
class FXPyMenuButton : public FXMenuButton {
    FXDECLARE(FXPyMenuButton)
public:
    FXPyMenuButton(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXPopup* pup=NULL,FXuint opts=JUSTIFY_NORMAL|ICON_BEFORE_TEXT|MENUBUTTON_DOWN,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
