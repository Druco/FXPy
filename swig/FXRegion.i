/* FXRegion.i */

%pythonappend FX::FXRegion::FXRegion %{
  self.thisown = False
%}


%module FXRegion

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRegion.h"
