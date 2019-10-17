/* FXICOImage.i */

%pythonappend FX::FXICOImage::FXICOImage %{
  self.thisown = False
%}


%module FXICOImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXICOImage.h"
