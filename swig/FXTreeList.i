/* FXTreeList.i */

%pythonappend FX::FXTreeList::FXTreeList %{
  self.thisown = False
%}


%module FXTreeList

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTreeList.h"
