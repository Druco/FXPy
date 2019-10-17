/* FXRASIcon.i */

%pythonappend FX::FXRASIcon::FXRASIcon %{
  self.thisown = False
%}


%module FXRASIcon

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRASIcon.h"
