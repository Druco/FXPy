/* FXSystem.i */

%pythonappend FX::FXSystem::FXSystem %{
  self.thisown = False
%}


%module FXSystem

%include "include/fxdefs2.h"
%include "include/FXSystem.h"
