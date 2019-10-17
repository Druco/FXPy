/* FXStringDict.i */

%pythonappend FX::FXStringDict::FXStringDict %{
  self.thisown = False
%}


%module FXStringDict

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXStringDict.h"
