/* FXMenuCascade.i */

%pythonappend FX::FXMenuCascade::FXMenuCascade %{
  self.thisown = False
%}


%module FXMenuCascade

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMenuCascade.h"
