/* FXReplaceDialog.i */

%pythonappend FX::FXReplaceDialog::FXReplaceDialog %{
  self.thisown = False
%}


%module FXReplaceDialog

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXReplaceDialog.h"
