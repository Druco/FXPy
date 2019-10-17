/* FXDockHandler.i */

%pythonappend FX::FXDockHandler::FXDockHandler %{
  self.thisown = False
%}


%module FXDockHandler

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDockHandler.h"
