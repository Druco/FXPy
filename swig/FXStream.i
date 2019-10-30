/* FXStream.i */

%pythonappend FX::FXStream::FXStream %{
  self.thisown = False
%}

%include "include/FXStream.h"
