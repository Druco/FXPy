/* FXHash.i */

%pythonappend FX::FXHash::FXHash %{
  self.thisown = False
%}


%module FXHash

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXHash.h"
