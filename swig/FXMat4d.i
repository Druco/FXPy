/* FXMat4d.i */

%pythonappend FX::FXMat4d::FXMat4d %{
  self.thisown = False
%}


%module FXMat4d

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMat4d.h"
