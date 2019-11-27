/* FXOptionMenu.i */

%pythonappend FX::FXOption::FXOption %{
  self.thisown = False
%}
%pythonappend FX::FXPyOption::FXPyOption %{
  self.thisown = False
  FXPyRegister(self)
%}
%pythonappend FX::FXOptionMenu::FXOptionMenu %{
  self.thisown = False
%}
%pythonappend FX::FXPyOptionMenu::FXPyOptionMenu %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXOptionMenu.h"

namespace FX {
class FXPyOption : public FXOption {
    FXDECLARE(FXPyOption)
public:
    FXPyOption(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=JUSTIFY_NORMAL|ICON_BEFORE_TEXT,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}

namespace FX {
class FXPyOptionMenu : public FXOptionMenu {
public:
    FXPyOptionMenu(FXComposite* p,FXPopup* pup=NULL,FXuint opts=JUSTIFY_NORMAL|ICON_BEFORE_TEXT,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
