/* FXRealSlider.i */

%pythonappend FX::FXRealSlider::FXRealSlider %{
  self.thisown = False
%}


%module FXRealSlider

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXRealSlider.h"
