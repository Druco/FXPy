/* FXTriStateButton.i */

%pythonappend FX::FXTriStateButton::FXTriStateButton %{
  self.thisown = False
%}


%module FXTriStateButton

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTriStateButton.h"
