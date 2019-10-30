/* FXRectangle.i */

%pythonappend FX::FXRectangle::FXRectangle %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXRectangle.h"
