/* FXFontSelector.i */

%pythonappend FX::FXFontSelector::FXFontSelector %{
  self.thisown = False
%}


%module FXFontSelector

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXFontSelector.h"
