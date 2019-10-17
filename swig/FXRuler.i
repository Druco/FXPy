/* FXRuler.i */

%pythonappend FX::FXRuler::FXRuler %{
  self.thisown = False
%}


%module FXRuler

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRuler.h"
