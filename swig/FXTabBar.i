/* FXTabBar.i */

%pythonappend FX::FXTabBar::FXTabBar %{
  self.thisown = False
%}


%module FXTabBar

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTabBar.h"
