/* FXDir.i */

%pythonappend FX::FXDir::FXDir %{
  self.thisown = False
%}


%module FXDir

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDir.h"
