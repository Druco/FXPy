/* FXPipe.i */

%pythonappend FX::FXPipe::FXPipe %{
  self.thisown = False
%}


%module FXPipe

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXPipe.h"
