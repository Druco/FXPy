/* FXRulerView.i */

%pythonappend FX::FXRulerView::FXRulerView %{
  self.thisown = False
%}
%pythonappend FX::FXPyRulerView::FXPyRulerView %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXRulerView.h"

namespace FX {
class FXPyRulerView : public FXRulerView {
    FXDECLARE(FXPyRulerView)
public:
    FXPyRulerView(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
