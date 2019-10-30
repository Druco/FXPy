/* FXRegion.i */

%pythonappend FX::FXRegion::FXRegion %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXRegion.h"
