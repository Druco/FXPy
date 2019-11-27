/* FXDCPrint.i */

%pythonappend FX::FXDCPrint::FXDCPrint %{
  self.thisown = False
%}

%ignore FX::FXDCPrint::outhex;
%ignore FX::FXDCPrint::outf;

%include "include/fxdefs2.h"
%include "include/FXDCPrint.h"
