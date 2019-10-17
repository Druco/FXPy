/* FXGLObject.i */

%pythonappend FX::FXGLObject::FXGLObject %{
  self.thisown = False
%}


%module FXGLObject

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
#include "FXRangef.h"
#include "FXObjectList.h"
#include "FXGLObject.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGLObject.h"

