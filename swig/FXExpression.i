/* FXExpression.i */

%pythonappend FX::FXExpression::FXExpression %{
  self.thisown = False
%}


%module FXExpression

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXExpression.h"
