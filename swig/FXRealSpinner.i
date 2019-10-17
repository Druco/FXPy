/* FXRealSpinner.i */

%pythonappend FX::FXRealSpinner::FXRealSpinner %{
  self.thisown = False
%}


%module FXRealSpinner

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRealSpinner.h"
