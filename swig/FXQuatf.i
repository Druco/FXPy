/* FXQuatf.i */

%pythonappend FX::FXQuatf::FXQuatf %{
  self.thisown = False
%}


%module FXQuatf

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
#include "FXQuatf.h"
%}


%include "include/fxdefs2.h"
%include "include/FXQuatf.h"
