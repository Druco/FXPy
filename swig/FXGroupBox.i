/* FXGroupBox.i */

%pythonappend FX::FXGroupBox::FXGroupBox %{
  self.thisown = False
%}


%module FXGroupBox

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGroupBox.h"
