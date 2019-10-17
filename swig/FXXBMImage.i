/* FXXBMImage.i */

%pythonappend FX::FXXBMImage::FXXBMImage %{
  self.thisown = False
%}


%module FXXBMImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXXBMImage.h"
