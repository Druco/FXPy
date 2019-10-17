/* FXRASImage.i */

%pythonappend FX::FXRASImage::FXRASImage %{
  self.thisown = False
%}


%module FXRASImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRASImage.h"
