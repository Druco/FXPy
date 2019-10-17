/* FX4Splitter.i */

%pythonappend FX::FX4Splitter::FX4Splitter %{
  self.thisown = False
%}

#define __GNUC__
%module FX4Splitter

%{
#include "fxdefs2.h"
#include "include/FX4Splitter.h"
%}

%include "include/fxdefs2.h"
%include "include/FX4Splitter.h"
