/* FXDate.i */

%pythonappend FX::FXDate::FXDate %{
  self.thisown = False
%}


%module FXDate

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDate.h"
