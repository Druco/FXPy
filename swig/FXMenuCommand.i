/* FXMenuCommand.i */

%pythonappend FX::FXMenuCommand::FXMenuCommand %{
  self.thisown = False
%}


%module FXMenuCommand

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMenuCommand.h"
