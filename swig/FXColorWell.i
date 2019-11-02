/* FXColorWell.i */

%pythonappend FX::FXColorWell::FXColorWell %{
  self.thisown = False
%}
%pythonappend FX::FXPyColorWell::FXPyColorWell %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXColorWell.h"

namespace FX {
class FXPyColorWell : public FXColorWell {
public:
    FXPyColorWell(FXComposite* p,FXColor clr=0,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=COLORWELL_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

}
