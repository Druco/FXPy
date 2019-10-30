/* FXGroupBox.i */

%pythonappend FX::FXGroupBox::FXGroupBox %{
  self.thisown = False
%}
%pythonappend FX::FXPyGroupBox::FXPyGroupBox %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGroupBox.h"

namespace FX {
class FXPyGroupBox : public FXGroupBox {
public:
    FXPyGroupBox(FXComposite* p,const FXString& text,FXuint opts=GROUPBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};
}
