/* FXString.i */

%pythonappend FX::FXString::FXString %{
  self.thisown = False
%}

%ignore vformat;
%ignore vscan;
%ignore FXStringVFormat;


%include "include/fxdefs2.h"
%include "include/FXString.h"
