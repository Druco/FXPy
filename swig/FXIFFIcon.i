/* FXIFFIcon.i */

%pythonappend FX::FXIFFIcon::FXIFFIcon %{
  self.thisown = False
%}


%module FXIFFIcon

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXIFFIcon.h"
