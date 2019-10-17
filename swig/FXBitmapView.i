/* FXBitmapView.i */

%pythonappend FX::FXBitmapView::FXBitmapView %{
  self.thisown = False
%}


%module FXBitmapView

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXBitmapView.h"
