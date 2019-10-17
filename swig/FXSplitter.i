/* FXSplitter.i */

%pythonappend FX::FXSplitter::FXSplitter %{
  self.thisown = False
%}


%module FXSplitter

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSplitter.h"
