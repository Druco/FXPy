/* FXTopWindow.i */

%pythonappend FX::FXTopWindow::FXTopWindow %{
  self.thisown = False
%}


%module FXTopWindow

%{
#include "fxdefs2.h"
#include "fx.h"
%}

%feature("autodoc", "0");
%include "include/fxdefs2.h"
%include "include/FXTopWindow.h"
