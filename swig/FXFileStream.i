/* FXFileStream.i */

%pythonappend FX::FXFileStream::FXFileStream %{
  self.thisown = False
%}


%module FXFileStream

%include "include/fxdefs2.h"
%include "include/FXFileStream.h"
