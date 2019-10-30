/* FXColorDialog.i */

%pythonappend FX::FXColorDialog::FXColorDialog %{
  self.thisown = False
%}
%pythonappend FX::FXPyColorDialog::FXPyColorDialog %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXColorDialog.h"

namespace FX {
class FXPyColorDialog : public FXColorDialog {
  FXColorDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

}
