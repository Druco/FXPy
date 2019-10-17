/* FXDirList.i */

%pythonappend FX::FXDirList::FXDirList %{
  self.thisown = False
%}


%module FXDirList

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXDirList.h"
