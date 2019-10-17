/* FXPCXImage.i */

%pythonappend FX::FXPCXImage::FXPCXImage %{
  self.thisown = False
%}


%module FXPCXImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXPCXImage.h"
