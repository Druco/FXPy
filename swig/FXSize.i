/* FXSize.i */

%pythonappend FX::FXSize::FXSize %{
  self.thisown = False
%}


%module FXSize

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSize.h"
