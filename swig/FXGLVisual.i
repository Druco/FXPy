/* FXGLVisual.i */

%pythonappend FX::FXGLVisual::FXGLVisual %{
  self.thisown = False
%}


%module FXGLVisual

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXGLVisual.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGLVisual.h"
