/* FXVec4d.i */

%pythonappend FX::FXVec4d::FXVec4d %{
  self.thisown = False
%}


%module FXVec4d

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2d.h"
#include "FXVec3d.h"
#include "FXVec4d.h"
%}


%include "include/fxdefs2.h"
%include "include/FXVec4d.h"
