/* FXFontDialog.i */

%pythonappend FX::FXFontDialog::FXFontDialog %{
  self.thisown = False
%}


%module FXFontDialog

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXFontDialog.h"
