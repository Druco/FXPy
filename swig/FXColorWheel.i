/* FXColorWheel.i */

%pythonappend FX::FXColorWheel::FXColorWheel %{
  self.thisown = False
%}


%module FXColorWheel

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXColorWheel.h"
