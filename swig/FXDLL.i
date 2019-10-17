/* FXDLL.i */

%pythonappend FX::FXDLL::FXDLL %{
  self.thisown = False
%}


%module FXDLL

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDLL.h"
