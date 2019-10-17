/* FXFileList.i */

%pythonappend FX::FXFileList::FXFileList %{
  self.thisown = False
%}


%module FXFileList

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXFileList.h"
