/* FXStat.i */

%pythonappend FX::FXStat::FXStat %{
  self.thisown = False
%}


%module FXStat

%include "include/fxdefs2.h"
%include "include/FXStat.h"
