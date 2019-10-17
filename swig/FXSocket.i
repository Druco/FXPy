/* FXSocket.i */

%pythonappend FX::FXSocket::FXSocket %{
  self.thisown = False
%}


%module FXSocket

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXSocket.h"
