/* FXArrowButton.i */

%pythonappend FX::FXArrowButton::FXArrowButton %{
  self.thisown = False
%}


#define __GNUC__
%module FXArrowButton

%{
#include "fxdefs2.h"
#include "fx.h"
%}

%include "include/fxdefs2.h"
%include "include/FXArrowButton.h"
