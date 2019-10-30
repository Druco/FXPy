/* FXFile.i */

%pythonappend FX::FXFile::FXFile %{
  self.thisown = False
%}


%module FXFile


%include "include/fxdefs2.h"
%include "include/FXFile.h"
