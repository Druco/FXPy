/* FXCanvas.i */

%pythonappend FX::FXCanvas::FXCanvas %{
  self.thisown = False
%}


%module FXCanvas

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXCanvas.h"
