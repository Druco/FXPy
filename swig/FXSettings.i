/* FXSettings.i */

%pythonappend FX::FXSettings::FXSettings %{
  self.thisown = False
%}


%module FXSettings

%{
#include "fxdefs2.h"
#include "fx.h"
#include "FXSettings.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSettings.h"
