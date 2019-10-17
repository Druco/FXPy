/* FXChoiceBox.i */

%pythonappend FX::FXChoiceBox::FXChoiceBox %{
  self.thisown = False
%}


%module FXChoiceBox

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXChoiceBox.h"
