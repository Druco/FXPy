/* FXStatusBar.i */

%pythonappend FX::FXStatusBar::FXStatusBar %{
  self.thisown = False
%}


%module FXStatusBar

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXStatusBar.h"
