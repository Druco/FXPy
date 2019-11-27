/* FXDCWindow.i */

%pythonappend FX::FXDCWindow::FXDCWindow %{
  self.thisown = False
%}
%pythonappend FX::FXPyDCWindow::FXPyDCWindow %{
  self.thisown = False
%}

#include "include/FXDC.h"

%include "include/fxdefs2.h"
%include "include/FXDCWindow.h"
