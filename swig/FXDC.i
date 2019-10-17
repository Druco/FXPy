/* FXDC.i */

%pythonappend FX::FXDC::FXDC %{
  self.thisown = False
%}


%module FXDC

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDC.h"
