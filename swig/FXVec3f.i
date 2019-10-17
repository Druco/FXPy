/* FXVec3f.i */

%pythonappend FX::FXVec3f::FXVec3f %{
  self.thisown = False
%}


%module FXVec3f

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
%}


%include "include/fxdefs2.h"
%include "include/FXVec3f.h"
