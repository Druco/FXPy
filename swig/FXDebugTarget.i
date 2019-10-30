/* FXDebugTarget.i */

%pythonappend FX::FXDebugTarget::FXDebugTarget %{
  self.thisown = False
%}


%module FXDebugTarget

%{
%}


%include "include/fxdefs2.h"
%include "include/FXDebugTarget.h"
