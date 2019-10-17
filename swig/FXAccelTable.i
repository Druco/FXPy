/* FXAccelTable.i */


%pythonappend FX::FXAccelTable::FXAccelTable %{
  self.thisown = False
%}

%module FXAccelTable

%{
#include "fxdefs2.h"
#include "fx.h"
%}

%include "include/fxdefs2.h"
%include "include/FXAccelTable.h"
