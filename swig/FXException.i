/* FXException.i */

%pythonappend FX::FXException::FXException %{
  self.thisown = False
%}


%module FXException

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXException.h"
