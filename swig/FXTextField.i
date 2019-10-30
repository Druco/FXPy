/* FXTextField.i */

%pythonappend FX::FXTextField::FXTextField %{
  self.thisown = False
%}
%pythonappend FX::FXPyTextField::FXPyTextField %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTextField.h"

namespace FX {
class FXPyTextField : public FXTextField {
public:
    FXPyTextField(FXComposite* p,FXint ncols,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TEXTFIELD_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
