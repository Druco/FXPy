/* FXCURCursor.i */

%pythonappend FX::FXCURCursor::FXCURCursor %{
  self.thisown = False
%}


%module FXCURCursor

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXCURCursor.h"
