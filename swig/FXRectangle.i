/* FXRectangle.i */

%pythonappend FX::FXRectangle::FXRectangle %{
  self.thisown = False
%}


%module FXRectangle

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRectangle.h"
