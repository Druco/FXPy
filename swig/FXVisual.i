/* FXVisual.i */

%pythonappend FX::FXVisual::FXVisual %{
  self.thisown = False
%}


%module FXVisual

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXVisual.h"
