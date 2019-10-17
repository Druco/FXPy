/* FXPicker.i */

%pythonappend FX::FXPicker::FXPicker %{
  self.thisown = False
%}


%module FXPicker

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXPicker.h"
