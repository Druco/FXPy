/* FXDockBar.i */

%pythonappend FX::FXDockBar::FXDockBar %{
  self.thisown = False
%}


%module FXDockBar

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDockBar.h"
