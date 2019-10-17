/* FXMatrix.i */

%pythonappend FX::FXMatrix::FXMatrix %{
  self.thisown = False
%}


%module FXMatrix

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMatrix.h"
