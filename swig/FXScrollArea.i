/* FXScrollArea.i */

%pythonappend FX::FXScrollArea::FXScrollArea %{
  self.thisown = False
%}
%pythonappend FX::FXPyScrollArea::FXPyScrollArea %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXScrollArea.h"

namespace FX {
    class FXPyScrollArea : public FXScrollArea {
        FXDECLARE(FXPyScrollArea)
    protected:
        FXPyScrollArea();
    };
 }
