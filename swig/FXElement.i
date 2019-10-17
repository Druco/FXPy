/* FXElement.i */

%pythonappend FX::FXElement::FXElement %{
  self.thisown = False
%}


%module FXElement

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXElement.h"
