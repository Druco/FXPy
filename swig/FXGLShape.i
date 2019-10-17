/* FXGLShape.i */

%pythonappend FX::FXGLShape::FXGLShape %{
  self.thisown = False
%}


%module FXGLShape

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
#include "FXGLShape.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGLShape.h"
