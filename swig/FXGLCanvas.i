/* FXGLCanvas.i */

%pythonappend FX::FXGLCanvas::FXGLCanvas %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLCanvas::FXPyGLCanvas %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLCanvas.h"

namespace FX {
class FXPyGLCanvas : public FXGLCanvas {
public:
    FXPyGLCanvas(FXComposite* p,FXGLVisual *vis,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
    FXPyGLCanvas(FXComposite* p,FXGLVisual *vis,FXGLCanvas* sharegroup,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
