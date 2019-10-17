/* FXSplashWindow.i */

%pythonappend FX::FXSplashWindow::FXSplashWindow %{
  self.thisown = False
%}


%module FXSplashWindow

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSplashWindow.h"
