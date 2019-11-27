/* FXSplashWindow.i */

%pythonappend FX::FXSplashWindow::FXSplashWindow %{
  self.thisown = False
%}
%pythonappend FX::FXPySplashWindow::FXPySplashWindow %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXSplashWindow.h"

namespace FX {
class FXPySplashWindow : public FXSplashWindow {
    FXDECLARE(FXPySplashWindow)
public:
    FXPySplashWindow(FXApp* ap,FXIcon* ic,FXuint opts=SPLASH_SIMPLE,FXuint ms=5000);
    FXPySplashWindow(FXWindow* ow,FXIcon* ic,FXuint opts=SPLASH_SIMPLE,FXuint ms=5000);

};
}
