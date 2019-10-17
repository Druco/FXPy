/* FXMenuSeparator.i */

%pythonappend FX::FXMenuSeparator::FXMenuSeparator %{
  self.thisown = False
%}


%module FXMenuSeparator

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMenuSeparator.h"
