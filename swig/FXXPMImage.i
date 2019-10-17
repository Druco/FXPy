/* FXXPMImage.i */

%pythonappend FX::FXXPMImage::FXXPMImage %{
  self.thisown = False
%}


%module FXXPMImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXXPMImage.h"
