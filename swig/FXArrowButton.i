/* FXArrowButton.i */

%pythonappend FX::FXArrowButton::FXArrowButton %{
  self.thisown = False
%}
%pythonappend FX::FXPyArrowButton::FXPyArrowButton %{
  self.thisown = False
  FXPyRegister(self)
%}

#define __GNUC__

%include "include/fxdefs2.h"
%include "include/FXArrowButton.h"

namespace FX {
class FXPyArrowButton : FXArrowButton {
  FXPyArrowButton(FX::FXComposite* p,FX::FXObject* tgt=NULL,FX::FXSelector sel=0,FX::FXuint opts=ARROW_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0,FX::FXint pl=DEFAULT_PAD,FX::FXint pr=DEFAULT_PAD,FX::FXint pt=DEFAULT_PAD,FX::FXint pb=DEFAULT_PAD);
};
}
