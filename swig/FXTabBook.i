/* FXTabBook.i */

%pythonappend FX::FXTabBook::FXTabBook %{
  self.thisown = False
%}


%module FXTabBook

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTabBook.h"
