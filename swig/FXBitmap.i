/* FXBitmap.i */

%pythonappend FX::FXBitmap::FXBitmap %{
  self.thisown = False
%}


#define __GNUC__
%module FXBitmap

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXBitmap.h"
