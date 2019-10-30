/* FXPath.i */

%pythonappend FX::FXPath::FXPath %{
  self.thisown = False
%}


%module FXPath

%include "include/fxdefs2.h"
%include "include/FXPath.h"
