/* FXExtentf.i */

%pythonappend FX::FXExtentf::FXExtentf %{
  self.thisown = False
%}


%module FXExtentf

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2f.h"
#include "FXExtentf.h"
%}


%include "include/fxdefs2.h"
%include "include/FXExtentf.h"
