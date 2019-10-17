/* FXJPGImage.i */

%pythonappend FX::FXJPGImage::FXJPGImage %{
  self.thisown = False
%}


%module FXJPGImage

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXJPGImage.h"
%}


%include "include/fxdefs2.h"
%include "include/FXJPGImage.h"
