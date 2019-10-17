/* FXRootWindow.i */

%pythonappend FX::FXRootWindow::FXRootWindow %{
  self.thisown = False
%}


%module FXRootWindow

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRootWindow.h"
