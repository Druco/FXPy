/* FXMat3d.i */

%pythonappend FX::FXMat3d::FXMat3d %{
  self.thisown = False
%}


%module FXMat3d

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMat3d.h"
