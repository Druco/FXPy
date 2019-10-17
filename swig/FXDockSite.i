/* FXDockSite.i */

%pythonappend FX::FXDockSite::FXDockSite %{
  self.thisown = False
%}


%module FXDockSite

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDockSite.h"
