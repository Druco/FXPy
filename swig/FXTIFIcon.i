/* FXTIFIcon.i */

%pythonappend FX::FXTIFIcon::FXTIFIcon %{
  self.thisown = False
%}


%module FXTIFIcon

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXTIFIcon.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTIFIcon.h"
