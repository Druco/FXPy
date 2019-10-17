/* FXPCXIcon.i */

%pythonappend FX::FXPCXIcon::FXPCXIcon %{
  self.thisown = False
%}


%module FXPCXIcon

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXPCXIcon.h"
