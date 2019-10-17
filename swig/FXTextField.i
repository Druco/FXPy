/* FXTextField.i */

%pythonappend FX::FXTextField::FXTextField %{
  self.thisown = False
%}


%module FXTextField

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTextField.h"
