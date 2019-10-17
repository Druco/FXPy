/* FXBMPImage.i */

%pythonappend FX::FX::FX %{
  self.thisown = False
%}

%pythonappend FX::FXBMPImage::FXBMPImage %{
  self.thisown = False
%}


#define __GNUC__
%module FXBMPImage

%{
#include "fxdefs2.h"
#include "fx.h"
%}

%include "include/fxdefs2.h"
%include "include/FXBMPImage.h"
