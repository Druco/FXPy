/* FXRadioButton.i */

%pythonappend FX::FXRadioButton::FXRadioButton %{
  self.thisown = False
%}


%module FXRadioButton

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRadioButton.h"
