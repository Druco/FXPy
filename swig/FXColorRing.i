/* FXColorRing.i */

%pythonappend FX::FXColorRing::FXColorRing %{
  self.thisown = False
%}
%pythonappend FX::FXPyColorRing::FXPyColorRing %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXColorRing.h"

namespace FX {
class FXPyColorRing : public FXColorRing {
public:
  FXPyColorRing(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

}
