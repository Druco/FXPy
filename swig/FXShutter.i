/* FXShutter.i */

%pythonappend FX::FXShutter::FXShutter %{
  self.thisown = False
%}


%module FXShutter

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXShutter.h"
