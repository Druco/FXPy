/* FXComboBox.i */

%pythonappend FX::FXComboBox::FXComboBox %{
  self.thisown = False
%}
%pythonappend FX::FXPyComboBox::FXPyComboBox %{
  self.thisown = False
  FXPyRegister(self)
%}

%ignore FXComboBox();

%include "include/fxdefs2.h"
%include "include/FXComboBox.h"

namespace FX {
class FXPyComboBox : public FXComboBox {
    FXDECLARE(FXPyComboBox)
public:
    FXPyComboBox(FXComposite *p,FXint cols,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=COMBOBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
