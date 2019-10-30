/* FXFileList.i */

%pythonappend FX::FXFileItem::FXFileItem %{
  self.thisown = False
%}
%pythonappend FX::FXFileList::FXFileList %{
  self.thisown = False
%}


%include "include/fxdefs2.h"
%include "include/FXFileList.h"
