/* FXGLCube.i */

%pythonappend FX::FXGLCube::FXGLCube %{
  self.thisown = False
%}


%module FXGLCube

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
#include "FXQuatf.h"
#include "FXMat4f.h"
#include "FXRangef.h"
#include "FXGLViewer.h"
#include "FXGLCube.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGLCube.h"
