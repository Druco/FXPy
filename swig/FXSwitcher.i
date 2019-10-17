/* FXSwitcher.i */

%pythonappend FX::FXSwitcher::FXSwitcher %{
  self.thisown = False
%}


%module FXSwitcher

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSwitcher.h"
