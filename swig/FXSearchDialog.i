/* FXSearchDialog.i */

%pythonappend FX::FXSearchDialog::FXSearchDialog %{
  self.thisown = False
%}


%module FXSearchDialog

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSearchDialog.h"
