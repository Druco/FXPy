/* FXWizard.i */

%pythonappend FX::FXWizard::FXWizard %{
  self.thisown = False
%}


%module FXWizard

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXWizard.h"
