/* FXShell.i */

%pythonappend FX::FXShell::FXShell %{
  self.thisown = False
%}


%module FXShell

%include "include/fxdefs2.h"
%include "include/FXShell.h"
