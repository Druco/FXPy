/* FXOptionMenu.i */

%pythonappend FX::FXOptionMenu::FXOptionMenu %{
  self.thisown = False
%}


%module FXOptionMenu

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXOptionMenu.h"
