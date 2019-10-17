/* FXMat3f.i */

%pythonappend FX::FXMat3f::FXMat3f %{
  self.thisown = False
%}


%module FXMat3f

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMat3f.h"
