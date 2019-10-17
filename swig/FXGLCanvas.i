/* FXGLCanvas.i */

%pythonappend FX::FXGLCanvas::FXGLCanvas %{
  self.thisown = False
%}


%module FXGLCanvas

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXGLCanvas.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGLCanvas.h"
