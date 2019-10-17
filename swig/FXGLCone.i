/* FXGLCone.i */

%pythonappend FX::FXGLCone::FXGLCone %{
  self.thisown = False
%}


%module FXGLCone

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
#include "FXRangef.h"
#include "FXQuatf.h"
#include "FXMat4f.h"
#include "FXGLViewer.h"
#include "FXGLCone.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGLCone.h"
