/* FXToggleButton.i */

%pythonappend FX::FXToggleButton::FXToggleButton %{
  self.thisown = False
%}


%module FXToggleButton

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXToggleButton.h"
