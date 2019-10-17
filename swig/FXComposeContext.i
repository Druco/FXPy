/* FXComposeContext.i */

%pythonappend FX::FXComposeContext::FXComposeContext %{
  self.thisown = False
%}


%module FXComposeContext

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXComposeContext.h"
