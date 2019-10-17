/* FXTreeListBox.i */

%pythonappend FX::FXTreeListBox::FXTreeListBox %{
  self.thisown = False
%}


%module FXTreeListBox

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTreeListBox.h"
