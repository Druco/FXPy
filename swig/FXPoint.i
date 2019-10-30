/* FXPoint.i */

%pythonappend FX::FXPoint::FXPoint %{
  self.thisown = False
%}
%pythonappend FX::FXPyPoint::FXPyPoint %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXPoint.h"
