/* FXIconList.i */

%pythonappend FX::FXIconList::FXIconList %{
  self.thisown = False
%}
%pythonappend FX::FXPyIconList::FXPyIconList %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXIconList.h"
