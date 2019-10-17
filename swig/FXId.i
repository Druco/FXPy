/* FXId.i */

%pythonappend FX::FXId::FXId %{
  self.thisown = False
%}


%module FXId

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXId.h"
