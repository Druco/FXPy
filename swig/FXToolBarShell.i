/* FXToolBarShell.i */

%pythonappend FX::FXToolBarShell::FXToolBarShell %{
  self.thisown = False
%}


%module FXToolBarShell

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXToolBarShell.h"
