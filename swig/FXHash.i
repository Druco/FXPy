/* FXHash.i */

%pythonappend FX::FXHash::FXHash %{
  self.thisown = False
%}


%module FXHash

%include "include/fxdefs2.h"
%include "include/FXHash.h"
