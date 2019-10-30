/* FXText.i */

%pythonappend FX::FXText::FXText %{
  self.thisown = False
%}
%pythonappend FX::FXPyText::FXPyText %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXText.h"

namespace FX {
class FXPyText : public FXText {
public:
    FXPyText(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2);
};
}
