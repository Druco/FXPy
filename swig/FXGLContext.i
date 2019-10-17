/* FXGLContext.i */

%pythonappend FX::FXGLContext::FXGLContext %{
  self.thisown = False
%}


%module FXGLContext

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXGLContext.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGLContext.h"
