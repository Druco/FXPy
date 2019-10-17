/* FXExtentd.i */

%pythonappend FX::FXExtentd::FXExtentd %{
  self.thisown = False
%}


%module FXExtentd

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2d.h"
#include "FXExtentd.h"
%}


%include "include/fxdefs2.h"
%include "include/FXExtentd.h"
