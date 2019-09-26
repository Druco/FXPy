/* FXObjectList.i */


%module FXObjectList

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
#include "FXRangef.h"
#include "FXGLObject.h"
%}


%include "include/fxdefs2.h"
%include "include/FXObjectList.h"
%template(FXGLObjectList) FX::FXObjectListOf<FXGLObject>;
