/* FXPipe.i */

%pythonappend FX::FXPipe::FXPipe %{
  self.thisown = False
%}
%pythonappend FX::FXPyPipe::FXPyPipe %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXPipe.h"
