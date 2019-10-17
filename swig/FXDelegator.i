/* FXDelegator.i */

%pythonappend FX::FXDelegator::FXDelegator %{
  self.thisown = False
%}


%module FXDelegator

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDelegator.h"
