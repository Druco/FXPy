/* FXIFFImage.i */

%pythonappend FX::FXIFFImage::FXIFFImage %{
  self.thisown = False
%}


%module FXIFFImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXIFFImage.h"
