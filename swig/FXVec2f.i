/* FXVec2f.i */

%pythonappend FX::FXVec2f::FXVec2f %{
  self.thisown = False
%}


%module FXVec2f

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2f.h"
%}


%include "include/fxdefs2.h"
%include "include/FXVec2f.h"
