/* FXVec3d.i */

%pythonappend FX::FXVec3d::FXVec3d %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXVec3d.h"
