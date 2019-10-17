/* FXFileSelector.i */

%pythonappend FX::FXFileSelector::FXFileSelector %{
  self.thisown = False
%}


%module FXFileSelector

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXFileSelector.h"
