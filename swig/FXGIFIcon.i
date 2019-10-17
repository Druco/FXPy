/* FXGIFIcon.i */

%pythonappend FX::FXGIFIcon::FXGIFIcon %{
  self.thisown = False
%}


%module FXGIFIcon

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGIFIcon.h"
