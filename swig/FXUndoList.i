/* FXUndoList.i */

%pythonappend FX::FXUndoList::FXUndoList %{
  self.thisown = False
%}


%module FXUndoList

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXUndoList.h"
