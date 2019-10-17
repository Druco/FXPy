/* FXDirSelector.i */

%pythonappend FX::FXDirSelector::FXDirSelector %{
  self.thisown = False
%}


%module FXDirSelector

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDirSelector.h"
