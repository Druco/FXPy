/* FXCheckButton.i */

%pythonappend FX::FXCheckButton::FXCheckButton %{
  self.thisown = False
%}


%module FXCheckButton

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXCheckButton.h"
