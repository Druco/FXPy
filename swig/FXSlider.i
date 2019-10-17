/* FXSlider.i */

%pythonappend FX::FXSlider::FXSlider %{
  self.thisown = False
%}


%module FXSlider

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSlider.h"
