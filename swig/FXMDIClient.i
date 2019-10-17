/* FXMDIClient.i */

%pythonappend FX::FXMDIClient::FXMDIClient %{
  self.thisown = False
%}


%module FXMDIClient

%{
#include "fxdefs2.h"
#include "fx.h"
%}


%include "include/fxdefs2.h"
%include "include/FXMDIClient.h"
