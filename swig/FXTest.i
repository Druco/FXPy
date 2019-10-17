/* FXObject.i */

%pythonappend FX::FXObject::FXObject %{
  self.thisown = False
%}

%module FXTest

%{
#include "fxdefs2.h"
#include "fx.h"
%}

%include "include/fxdefs2.h"
%include "include/FXTest.h"
