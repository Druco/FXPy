/* FXPoint.i */

%pythonappend FX::FXPoint::FXPoint %{
  self.thisown = False
%}


%module FXPoint

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXPoint.h"
