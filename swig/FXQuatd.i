/* FXQuatd.i */

%pythonappend FX::FXQuatd::FXQuatd %{
  self.thisown = False
%}
%pythonappend FX::FXPyQuatd::FXPyQuatd %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXQuatd.h"
