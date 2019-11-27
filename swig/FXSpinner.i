/* FXSpinner.i */

%pythonappend FX::FXSpinner::FXSpinner %{
  self.thisown = False
%}
%pythonappend FX::FXPySpinner::FXPySpinner %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXSpinner.h"

namespace FX {
class FXPySpinner : public FXSpinner {
    FXDECLARE(FXPySpinner)
public:
    FXPySpinner(FXComposite *p,FXint cols,FXObject *tgt=NULL,FXSelector sel=0,FXuint opts=SPIN_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
