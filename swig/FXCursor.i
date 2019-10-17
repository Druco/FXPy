/* FXCursor.i */

%pythonappend FX::FXCursor::FXCursor %{
  self.thisown = False
%}


%module FXCursor

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXCursor.h"
