/* FXGLSphere.i */

%pythonappend FX::FXGLSphere::FXGLSphere %{
  self.thisown = False
%}


%module FXGLSphere

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
#include "FXGLSphere.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGLSphere.h"
