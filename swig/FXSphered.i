/* FXSphered.i */

%pythonappend FX::FXSphered::FXSphered %{
  self.thisown = False
%}


%module FXSphered

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2d.h"
#include "FXVec3d.h"
#include "FXVec4d.h"
#include "FXSphered.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSphered.h"
