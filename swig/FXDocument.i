/* FXDocument.i */

%pythonappend FX::FXDocument::FXDocument %{
  self.thisown = False
%}


%module FXDocument

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDocument.h"
