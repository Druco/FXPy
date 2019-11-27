/* FXWizard.i */

%pythonappend FX::FXWizard::FXWizard %{
  self.thisown = False
%}
%pythonappend FX::FXPyWizard::FXPyWizard %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXWizard.h"

namespace FX {
class FXPyWizard : public FXWizard {
    FXDECLARE(FXPyWizard)
public:
    FXPyWizard(FXApp* a,const FXString& name,FXImage *image,FXuint opts=DECOR_TITLE|DECOR_BORDER|DECOR_RESIZE,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=10,FXint vs=10);
    FXPyWizard(FXWindow* owner,const FXString& name,FXImage *image,FXuint opts=DECOR_TITLE|DECOR_BORDER|DECOR_RESIZE,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=10,FXint vs=10);

};
}
