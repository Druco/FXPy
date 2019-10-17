/* FXFoldingList.i */

%pythonappend FX::FXFoldingList::FXFoldingList %{
  self.thisown = False
%}


%module FXFoldingList

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXFoldingList.h"
