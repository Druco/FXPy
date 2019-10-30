/* FXURL.i */

%pythonappend FX::FXURL::FXURL %{
  self.thisown = False
%}


%module FXURL

%include "include/fxdefs2.h"
%include "include/FXURL.h"
