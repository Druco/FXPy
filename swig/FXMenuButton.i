/* FXMenuButton.i */

%pythonappend FX::FXMenuButton::FXMenuButton %{
  self.thisown = False
%}


%module FXMenuButton

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMenuButton.h"
