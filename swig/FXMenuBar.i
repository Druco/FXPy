/* FXMenuBar.i */

%pythonappend FX::FXMenuBar::FXMenuBar %{
  self.thisown = False
%}


%module FXMenuBar

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMenuBar.h"
