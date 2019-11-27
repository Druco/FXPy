/* FXMatrix.i */

%pythonappend FX::FXMatrix::FXMatrix %{
  self.thisown = False
%}
%pythonappend FX::FXPyMatrix::FXPyMatrix %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMatrix.h"

namespace FX {
class FXPyMatrix : public FXMatrix {
    FXDECLARE(FXPyMatrix)
public:
    FXPyMatrix(FXComposite *p,FXint n=1,FXuint opts=MATRIX_BY_ROWS,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};
}
