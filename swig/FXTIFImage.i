/* FXTIFImage.i */

%pythonappend FX::FXTIFImage::FXTIFImage %{
  self.thisown = False
%}


%module FXTIFImage

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXTIFImage.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTIFImage.h"
