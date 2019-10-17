/* FXGUISignal.i */

%pythonappend FX::FXGUISignal::FXGUISignal %{
  self.thisown = False
%}


%module FXGUISignal

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXGUISignal.h"
