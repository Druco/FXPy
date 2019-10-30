/* FXDCPrint.i */

%pythonappend FX::FXDCPrint::FXDCPrint %{
  self.thisown = False
%}


%module FXDCPrint

%include "include/fxdefs2.h"
%include "include/FXDCPrint.h"
