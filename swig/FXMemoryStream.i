/* FXMemoryStream.i */

%pythonappend FX::FXMemoryStream::FXMemoryStream %{
  self.thisown = False
%}


%module FXMemoryStream

%include "include/fxdefs2.h"
%include "include/FXMemoryStream.h"
