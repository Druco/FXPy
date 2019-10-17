/* FXBZFileStream.i */

%pythonappend FX::FXBZFileStream::FXBZFileStream %{
  self.thisown = False
%}


#define __GNUC__
%module FXBZFileStream

%{
#include "include/fxdefs.h"
#include "include/FXObject.h"
#include "include/FXBZFileStream.h"
%}


%include "include/FXBZFileStream.h"
