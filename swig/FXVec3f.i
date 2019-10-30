/* FXVec3f.i */

%pythonappend FX::FXVec3f::FXVec3f %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXVec3f.h"
