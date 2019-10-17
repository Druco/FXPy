/* FXColorDialog.i */

%pythonappend FX::FXColorDialog::FXColorDialog %{
  self.thisown = False
%}


%module FXColorDialog

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXColorDialog.h"
