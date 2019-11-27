/* FXGLShape.i */

%pythonappend FX::FXGLShape::FXGLShape %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLShape::FXPyGLShape %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLShape.h"

namespace FX {
class FXPyGLShape : public FXGLShape {
    FXDECLARE(FXPyGLShape)
public:
    FXPyGLShape(FXfloat x,FXfloat y,FXfloat z,FXuint opts);
    FXPyGLShape(FXfloat x,FXfloat y,FXfloat z,FXuint opts,const FXMaterial& front,const FXMaterial& back);
};
}
