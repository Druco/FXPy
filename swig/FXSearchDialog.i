/* FXSearchDialog.i */

%pythonappend FX::FXSearchDialog::FXSearchDialog %{
  self.thisown = False
%}
%pythonappend FX::FXPySearchDialog::FXPySearchDialog %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXSearchDialog.h"


namespace FX {
class FXPySearchDialog : public FXSearchDialog {
    FXDECLARE(FXPySearchDialog)
public:
    FXPySearchDialog(FXWindow* owner,const FXString& caption,FXIcon* ic=NULL,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
