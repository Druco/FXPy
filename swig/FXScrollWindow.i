/* FXScrollWindow.i */

%pythonappend FX::FXScrollWindow::FXScrollWindow %{
  self.thisown = False
%}


%module FXScrollWindow

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXScrollWindow.h"
