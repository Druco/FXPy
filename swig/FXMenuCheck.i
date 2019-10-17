/* FXMenuCheck.i */

%pythonappend FX::FXMenuCheck::FXMenuCheck %{
  self.thisown = False
%}


%module FXMenuCheck

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMenuCheck.h"
