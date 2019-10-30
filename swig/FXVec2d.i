/* FXVec2d.i */

%pythonappend FX::FXVec2d::FXVec2d %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXVec2d.h"
