/* FXException.i */

%pythonappend FX::FXException::FXException %{
  self.thisown = False
%}


%module FXException

%include "include/fxdefs2.h"
%include "include/FXException.h"
