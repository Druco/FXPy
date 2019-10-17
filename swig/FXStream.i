/* FXStream.i */

%pythonappend FX::FXStream::FXStream %{
  self.thisown = False
%}


%module FXStream

%{
#include "fxdefs2.h"
#include "fx.h"
%}

%include "include/fxdefs2.h"
%include "include/FXStream.h"
