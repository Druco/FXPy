/* FXDockTitle.i */

%pythonappend FX::FXDockTitle::FXDockTitle %{
  self.thisown = False
%}


%module FXDockTitle

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDockTitle.h"
