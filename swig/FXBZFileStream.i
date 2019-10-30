/* FXBZFileStream.i */

%pythonappend FX::FXBZFileStream::FXBZFileStream %{
  self.thisown = False
%}


#define __GNUC__
%module FXBZFileStream

%include "include/FXBZFileStream.h"
