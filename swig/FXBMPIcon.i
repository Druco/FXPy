/* FXBMPIcon.i */

%pythonappend FX::FXBMPIcon::FXBMPIcon %{
  self.thisown = False
%}


#define __GNUC__
%module FXBMPIcon

%{
#include "fxdefs2.h"
#include "fx.h"
%}

%include "include/fxdefs2.h"
%include "include/FXBMPIcon.h"
