/* FXMessageBox.i */

%pythonappend FX::FXMessageBox::FXMessageBox %{
  self.thisown = False
%}
%pythonappend FX::FXPyMessageBox::FXPyMessageBox %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMessageBox.h"

namespace FX {
class FXPyMessageBox : public FXMessageBox {
public:
    FXPyMessageBox(FXWindow* owner,const FXString& caption,const FXString& text,FXIcon* ic=NULL,FXuint opts=0,FXint x=0,FXint y=0);
    FXPyMessageBox(FXApp* app,const FXString& caption,const FXString& text,FXIcon* ic=NULL,FXuint opts=0,FXint x=0,FXint y=0);
};
}
