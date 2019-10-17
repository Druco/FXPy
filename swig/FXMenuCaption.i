/* FXMenuCaption.i */

%pythonappend FX::FXMenuCaption::FXMenuCaption %{
  self.thisown = False
%}


%module FXMenuCaption

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMenuCaption.h"
