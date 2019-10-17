/* FXIO.i */

%pythonappend FX::FXIO::FXIO %{
  self.thisown = False
%}


%module FXIO

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXIO.h"
