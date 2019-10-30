/* FXGZFileStream.i */

%pythonappend FX::FXGZFileStream::FXGZFileStream %{
  self.thisown = False
%}


%module FXGZFileStream

%include "include/fxdefs2.h"
%include "include/FXGZFileStream.h"
