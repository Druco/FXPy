/* FXColorSelector.i */

%pythonappend FX::FXColorSelector::FXColorSelector %{
  self.thisown = False
%}


%module FXColorSelector

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXColorSelector.h"
