/* FXScrollBar.i */

%pythonappend FX::FXScrollBar::FXScrollBar %{
  self.thisown = False
%}


%module FXScrollBar

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXScrollBar.h"
