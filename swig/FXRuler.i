/* FXRuler.i */

%pythonappend FX::FXRuler::FXRuler %{
  self.thisown = False
%}
%pythonappend FX::FXPyRuler::FXPyRuler %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRuler.h"

namespace FX {
class FXPyRuler : public FXRuler {
public:
    FXPyRuler(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=RULER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
