/* FXRulerView.i */

%pythonappend FX::FXRulerView::FXRulerView %{
  self.thisown = False
%}


%module FXRulerView

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRulerView.h"
