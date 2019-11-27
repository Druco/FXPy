/* FXDirDialog.i */

%pythonappend FX::FXDirDialog::FXDirDialog %{
  self.thisown = False
%}
%pythonappend FX::FXPyDirDialog::FXPyDirDialog %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXDirDialog.h"

namespace FX {
class FXPyDirDialog : public FXDirDialog {
    FXDECLARE(FXPyDirDialog)
public:
    FXPyDirDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=400,FXint h=300);
    FXPyDirDialog(FXApp* a,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=400,FXint h=300);
};

}
