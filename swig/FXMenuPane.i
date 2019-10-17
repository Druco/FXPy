/* FXMenuPane.i */

%pythonappend FX::FXMenuPane::FXMenuPane %{
  self.thisown = False
%}


%module FXMenuPane

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMenuPane.h"
