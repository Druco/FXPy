/* FXSpring.i */

%pythonappend FX::FXSpring::FXSpring %{
  self.thisown = False
%}


%module FXSpring

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSpring.h"
