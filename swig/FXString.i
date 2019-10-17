/* FXString.i */

%pythonappend FX::FXString::FXString %{
  self.thisown = False
%}


%module FXString

%{
#include "fxdefs.h"
#include "fxdefs2.h"
#include "fx.h"
%}

%ignore vformat;
%ignore vscan;
%ignore FXStringVFormat;


%include "include/fxdefs2.h"
%include "include/FXString.h"
