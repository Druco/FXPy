/* FXDC.i */

%pythonappend FX::FXDC::FXDC %{
  self.thisown = False
%}
%pythonappend FX::FXPyDC::FXPyDC %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXDC.h"
