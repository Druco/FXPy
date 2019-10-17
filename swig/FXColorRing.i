/* FXColorRing.i */

%pythonappend FX::FXColorRing::FXColorRing %{
  self.thisown = False
%}


%module FXColorRing

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXColorRing.h"
