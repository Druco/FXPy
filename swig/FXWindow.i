/* FXWindow.i */

%pythonappend FX::FXWindow::FXWindow %{
  self.thisown = False
%}


%module FXWindow

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXWindow.h"
