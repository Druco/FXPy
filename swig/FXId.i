/* FXId.i */

%pythonappend FX::FXId::FXId %{
  self.thisown = False
%}


%module FXId

%include "include/fxdefs2.h"
%include "include/FXId.h"
