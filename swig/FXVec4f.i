/* FXVec4f.i */

%pythonappend FX::FXVec4f::FXVec4f %{
  self.thisown = False
%}


%module FXVec4f

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
%}


%include "include/fxdefs2.h"
%include "include/FXVec4f.h"
