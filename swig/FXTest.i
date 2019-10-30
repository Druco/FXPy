/* FXObject.i */

%pythonappend FX::FXObject::FXObject %{
  self.thisown = False
%}

%module FXTest

%include "include/FXTest.h"
