/* FXBitmapView.i */

%pythonappend FX::FXBitmapView::FXBitmapView %{
  self.thisown = False
%}
%pythonappend FX::FXPyBitmapView::FXPyBitmapView %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXBitmapView.h"

namespace FX {
class FXPyBitmapView : public FXBitmapView {
  FXPyBitmapView(FXComposite* p,FXBitmap* bmp=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
