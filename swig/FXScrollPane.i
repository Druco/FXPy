/* FXScrollPane.i */

%pythonappend FX::FXScrollPane::FXScrollPane %{
  self.thisown = False
%}


%module FXScrollPane

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXScrollPane.h"
