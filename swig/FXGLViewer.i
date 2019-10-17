/* FXGLViewer.i */

%pythonappend FX::FXGLViewer::FXGLViewer %{
  self.thisown = False
%}


%module FXGLViewer

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
%}


%include "include/fxdefs2.h"
%include "include/FXGLViewer.h"
