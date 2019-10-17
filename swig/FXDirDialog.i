/* FXDirDialog.i */

%pythonappend FX::FXDirDialog::FXDirDialog %{
  self.thisown = False
%}


%module FXDirDialog

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDirDialog.h"
