/* FXExtentd.i */

%pythonappend FX::FXExtentd::FXExtentd %{
  self.thisown = False
%}


%module FXExtentd

%include "include/fxdefs2.h"
%include "include/FXExtentd.h"
