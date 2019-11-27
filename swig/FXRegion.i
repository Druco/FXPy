/* FXRegion.i */

%pythonappend FX::FXRegion::FXRegion %{
  self.thisown = False
%}

// Redefine the FXRectangle typemap for the 'bounds' call
%typemap(out) FXRectangle %{
    $result = SWIG_NewPointerObj(SWIG_as_voidptr(new FX::FXRectangle($1.x,$1.y,$1.w,$1.h)), SWIGTYPE_p_FX__FXRectangle, 0 );
%}


%include "include/fxdefs2.h"
%include "include/FXRegion.h"

%typemap(out) FXRectangle %{
    $result = SWIG_NewPointerObj(&$1, SWIGTYPE_p_FX__FXRectangle, 0 |  0 );
%}

