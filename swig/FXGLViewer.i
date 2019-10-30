/* FXGLViewer.i */

%pythonappend FX::FXGLViewer::FXGLViewer %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLViewer::FXPyGLViewer %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLViewer.h"

namespace FX {
class FXPyGLViewer : public FXGLViewer {
public:
    FXPyGLViewer(FXComposite* p,FXGLVisual *vis,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
    FXPyGLViewer(FXComposite* p,FXGLVisual *vis,FXGLViewer* sharegroup,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
