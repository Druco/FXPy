/* FXGIFCursor.i */

%pythonappend FX::FXGIFCursor::FXGIFCursor %{
  self.thisown = False
%}


%module FXGIFCursor

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGIFCursor.h"
