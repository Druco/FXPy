/* FXExpression.i */

%pythonappend FX::FXExpression::FXExpression %{
  self.thisown = False
%}


%module FXExpression

%include "include/fxdefs2.h"
%include "include/FXExpression.h"
