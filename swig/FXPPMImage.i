/* FXPPMImage.i */

%pythonappend FX::FXPPMImage::FXPPMImage %{
  self.thisown = False
%}


%module FXPPMImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXPPMImage.h"
