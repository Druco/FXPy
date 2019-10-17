/* FXFileStream.i */

%pythonappend FX::FXFileStream::FXFileStream %{
  self.thisown = False
%}


%module FXFileStream

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXFileStream.h"
