/* FXTabItem.i */

%pythonappend FX::FXTabItem::FXTabItem %{
  self.thisown = False
%}


%module FXTabItem

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTabItem.h"
