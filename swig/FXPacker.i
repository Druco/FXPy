/* FXPacker.i */

%pythonappend FX::FXPacker::FXPacker %{
  self.thisown = False
%}


%module FXPacker

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXPacker.h"
