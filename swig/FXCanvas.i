/* FXCanvas.i */

%pythonappend FX::FXCanvas::FXCanvas %{
  self.thisown = False
%}
%pythonappend FX::FXPyCanvas::FXPyCanvas %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXCanvas.h"

namespace FX {
class FXPyCanvas : public FXCanvas {
public:
    FXCanvas(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

}
