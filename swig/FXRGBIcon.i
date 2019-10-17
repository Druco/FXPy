/* FXRGBIcon.i */

%pythonappend FX::FXRGBIcon::FXRGBIcon %{
  self.thisown = False
%}


%module FXRGBIcon

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRGBIcon.h"
