/* FXRegistry.i */

%pythonappend FX::FXRegistry::FXRegistry %{
  self.thisown = False
%}


%module FXRegistry

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRegistry.h"
