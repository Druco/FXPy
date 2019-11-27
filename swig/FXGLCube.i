/* FXGLCube.i */

%pythonappend FX::FXGLCube::FXGLCube %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLCube::FXPyGLCube %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLCube.h"

namespace FX {
class FXPyGLCube : public FXGLCube {
    FXDECLARE(FXPyGLCube)
public:
    FXPyGLCube(FXfloat x,FXfloat y,FXfloat z,FXfloat w=1.0f,FXfloat h=1.0f,FXfloat d=1.0f);
    FXPyGLCube(FXfloat x,FXfloat y,FXfloat z,FXfloat w,FXfloat h,FXfloat d,const FXMaterial& mtl);
};
}
