/* FXMemMap.i */

%pythonappend FX::FXMemMap::FXMemMap %{
  self.thisown = False
%}


%module FXMemMap

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMemMap.h"
