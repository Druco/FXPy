/* FXTranslator.i */

%pythonappend FX::FXTranslator::FXTranslator %{
  self.thisown = False
%}


%module FXTranslator

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXTranslator.h"
%}


%include "include/fxdefs2.h"
%include "include/FXTranslator.h"
