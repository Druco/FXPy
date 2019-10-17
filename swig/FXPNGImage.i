/* FXPNGImage.i */

%pythonappend FX::FXPNGImage::FXPNGImage %{
  self.thisown = False
%}


%module FXPNGImage

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXPNGImage.h"
%}


%include "include/fxdefs2.h"
%include "include/FXPNGImage.h"
