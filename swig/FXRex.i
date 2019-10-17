/* FXRex.i */

%pythonappend FX::FXRex::FXRex %{
  self.thisown = False
%}


%module FXRex

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRex.h"
