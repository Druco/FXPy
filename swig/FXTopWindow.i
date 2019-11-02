/* FXTopWindow.i */

%pythonappend FX::FXTopWindow::FXTopWindow %{
  self.thisown = False
%}
%pythonappend FX::FXPyTopWindow::FXPyTopWindow %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTopWindow.h"

namespace FX {
class FXPyTopWindow : public FXTopWindow {
protected:
    FXPyTopWindow(FXApp* ap,const FXString& name,FXIcon *ic,FXIcon *mi,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs);
    FXPyTopWindow(FXWindow* ow,const FXString& name,FXIcon *ic,FXIcon *mi,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs);

};
}
