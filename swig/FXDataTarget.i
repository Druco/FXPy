/* FXDataTarget.i */

%pythonappend FX::FXDataTarget::FXDataTarget %{
  self.thisown = False
%}


%module FXDataTarget

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDataTarget.h"
