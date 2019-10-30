/* FXReplaceDialog.i */

%pythonappend FX::FXReplaceDialog::FXReplaceDialog %{
  self.thisown = False
%}
%pythonappend FX::FXPyReplaceDialog::FXPyReplaceDialog %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXReplaceDialog.h"

namespace FX {
class FXPyReplaceDialog : public FXReplaceDialog {
public:
    FXPyReplaceDialog(FXWindow* owner,const FXString& caption,FXIcon* ic=NULL,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
