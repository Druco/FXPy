/* FXSpinner.i */

%pythonappend FX::FXSpinner::FXSpinner %{
  self.thisown = False
%}


%module FXSpinner

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSpinner.h"
