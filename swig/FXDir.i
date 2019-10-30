/* FXDir.i */

%pythonappend FX::FXDir::FXDir %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXDir.h"
