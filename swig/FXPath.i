/* FXPath.i */

%pythonappend FX::FXPath::FXPath %{
  self.thisown = False
%}


%module FXPath

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXPath.h"
