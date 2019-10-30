/* FXQuatf.i */

%pythonappend FX::FXQuatf::FXQuatf %{
  self.thisown = False
%}
%pythonappend FX::FXPyQuatf::FXPyQuatf %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXQuatf.h"
