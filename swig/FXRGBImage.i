/* FXRGBImage.i */

%pythonappend FX::FXRGBImage::FXRGBImage %{
  self.thisown = False
%}


%module FXRGBImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRGBImage.h"
