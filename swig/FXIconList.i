/* FXIconList.i */

%pythonappend FX::FXIconList::FXIconList %{
  self.thisown = False
%}


%module FXIconList

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXIconList.h"
