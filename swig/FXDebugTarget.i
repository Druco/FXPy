/* FXDebugTarget.i */

%pythonappend FX::FXDebugTarget::FXDebugTarget %{
  self.thisown = False
%}


%module FXDebugTarget

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDebugTarget.h"
