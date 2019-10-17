/* FXTGAImage.i */

%pythonappend FX::FXTGAImage::FXTGAImage %{
  self.thisown = False
%}


%module FXTGAImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTGAImage.h"
