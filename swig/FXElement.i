/* FXElement.i */

%pythonappend FX::FXElement::FXElement %{
  self.thisown = False
%}


%module FXElement

%{
%}


%include "include/fxdefs2.h"
%include "include/FXElement.h"
