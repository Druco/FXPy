/* FXFontDialog.i */

%pythonappend FX::FXFontDialog::FXFontDialog %{
  self.thisown = False
%}
%pythonappend FX::FXPyFontDialog::FXPyFontDialog %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXFontDialog.h"

namespace FX {
class FXPyFontDialog : public FXFontDialog {
public:
    FXPyFontDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=600,FXint h=380);
};
}
