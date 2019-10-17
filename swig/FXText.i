/* FXText.i */

%pythonappend FX::FXText::FXText %{
  self.thisown = False
%}


%module FXText

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXText.h"
