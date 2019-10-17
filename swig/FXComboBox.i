/* FXComboBox.i */

%pythonappend FX::FXComboBox::FXComboBox %{
  self.thisown = False
%}


%module FXComboBox

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXComboBox.h"
