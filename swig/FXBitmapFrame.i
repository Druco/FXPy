/* FXBitmapFrame.i */

%pythonappend FX::FXBitmapFrame::FXBitmapFrame %{
  self.thisown = False
%}


%module FXBitmapFrame

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXBitmapFrame.h"
