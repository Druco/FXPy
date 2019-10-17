/* FXToolBarTab.i */

%pythonappend FX::FXToolBarTab::FXToolBarTab %{
  self.thisown = False
%}


%module FXToolBarTab

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXToolBarTab.h"
