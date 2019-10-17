/* FXGZFileStream.i */

%pythonappend FX::FXGZFileStream::FXGZFileStream %{
  self.thisown = False
%}


%module FXGZFileStream

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGZFileStream.h"
