/* FXColorList.i */

%pythonappend FX::FXColorList::FXColorList %{
  self.thisown = False
%}


%module FXColorList

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXColorList.h"
%}


%include "include/fxdefs2.h"
%include "include/FXColorList.h"
