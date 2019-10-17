/* FXMDIChild.i */

%pythonappend FX::FXMDIChild::FXMDIChild %{
  self.thisown = False
%}


%module FXMDIChild

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMDIChild.h"
