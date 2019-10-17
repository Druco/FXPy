/* FXDrawable.i */

%pythonappend FX::FXDrawable::FXDrawable %{
  self.thisown = False
%}


%module FXDrawable

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDrawable.h"
