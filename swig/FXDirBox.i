/* FXDirBox.i */

%pythonappend FX::FXDirBox::FXDirBox %{
  self.thisown = False
%}


%module FXDirBox

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDirBox.h"
