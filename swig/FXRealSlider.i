/* FXRealSlider.i */

%pythonappend FX::FXRealSlider::FXRealSlider %{
  self.thisown = False
%}
%pythonappend FX::FXPyRealSlider::FXPyRealSlider %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRealSlider.h"

namespace FX {
class FXPyRealSlider : public FXRealSlider {
    FXDECLARE(FXPyRealSlider)
public:
    FXPyRealSlider(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=REALSLIDER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};
}
