/* FXMenuTitle.i */

%pythonappend FX::FXMenuTitle::FXMenuTitle %{
  self.thisown = False
%}


%module FXMenuTitle

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMenuTitle.h"
