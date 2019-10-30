/* FXToolBarGrip.i */

%pythonappend FX::FXToolBarGrip::FXToolBarGrip %{
  self.thisown = False
%}
%pythonappend FX::FXPyToolBarGrip::FXPyToolBarGrip %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXToolBarGrip.h"

namespace FX {
class FXPyToolBarGrip : public FXToolBarGrip {
public:
    FXPyToolBarGrip(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TOOLBARGRIP_SINGLE,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};
}
