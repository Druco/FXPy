/* FXToolBar.i */

%pythonappend FX::FXToolBar::FXToolBar %{
  self.thisown = False
%}


%module FXToolBar

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXToolBar.h"
