/* FXVec3d.i */

%pythonappend FX::FXVec3d::FXVec3d %{
  self.thisown = False
%}


%module FXVec3d

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2d.h"
#include "FXVec3d.h"
%}


%include "include/fxdefs2.h"
%include "include/FXVec3d.h"
