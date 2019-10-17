/* FXColorBar.i */

%pythonappend FX::FXColorBar::FXColorBar %{
  self.thisown = False
%}


%module FXColorBar

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXColorBar.h"
