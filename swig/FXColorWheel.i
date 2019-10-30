/* FXColorWheel.i */

%pythonappend FX::FXColorWheel::FXColorWheel %{
  self.thisown = False
%}
%pythonappend FX::FXPyColorWheel::FXPyColorWheel %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXColorWheel.h"

namespace FX {
class FXPyColorWheel : public FXColorWheel {
    FXPyColorWheel(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
