/* FXDCWindow.i */

%pythonappend FX::FXDCWindow::FXDCWindow %{
  self.thisown = False
%}


%module FXDCWindow

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDCWindow.h"
