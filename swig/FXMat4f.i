/* FXMat4f.i */

%pythonappend FX::FXMat4f::FXMat4f %{
  self.thisown = False
%}


%module FXMat4f

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMat4f.h"
