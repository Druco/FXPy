/* FXSlider.i */

%pythonappend FX::FXSlider::FXSlider %{
  self.thisown = False
%}
%pythonappend FX::FXPySlider::FXPySlider %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXSlider.h"


namespace FX {
class FXPySlider : public FXSlider {
public:
    FXPySlider(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=SLIDER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};
}
