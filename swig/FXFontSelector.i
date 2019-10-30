/* FXFontSelector.i */

%pythonappend FX::FXFontSelector::FXFontSelector %{
  self.thisown = False
%}
%pythonappend FX::FXPyFontSelector::FXPyFontSelector %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXFontSelector.h"

namespace FX {
class FXPyFontSelector : public FXFontSelector {
public:
  FXPyFontSelector(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
