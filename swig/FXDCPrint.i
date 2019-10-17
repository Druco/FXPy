/* FXDCPrint.i */

%pythonappend FX::FXDCPrint::FXDCPrint %{
  self.thisown = False
%}


%module FXDCPrint

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDCPrint.h"
