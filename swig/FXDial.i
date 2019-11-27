/* FXDial.i */

%pythonappend FX::FXDial::FXDial %{
  self.thisown = False
%}
%pythonappend FX::FXPyDial::FXPyDial %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXDial.h"

namespace FX {
class FXPyDial : public FXDial {
    FXDECLARE(FXPyDial)
public:
    FXPyDial(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=DIAL_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

}
