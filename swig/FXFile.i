/* FXFile.i */

%pythonappend FX::FXFile::FXFile %{
  self.thisown = False
%}


%module FXFile

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXFile.h"
