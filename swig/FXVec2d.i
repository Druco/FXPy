/* FXVec2d.i */

%pythonappend FX::FXVec2d::FXVec2d %{
  self.thisown = False
%}


%module FXVec2d

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2d.h"
%}


%include "include/fxdefs2.h"
%include "include/FXVec2d.h"
