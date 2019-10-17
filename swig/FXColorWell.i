/* FXColorWell.i */

%pythonappend FX::FXColorWell::FXColorWell %{
  self.thisown = False
%}


%module FXColorWell

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXColorWell.h"
