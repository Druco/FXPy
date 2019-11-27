/* FXGLCone.i */

%pythonappend FX::FXGLCone::FXGLCone %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLCone::FXPyGLCone %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLCone.h"

namespace FX {
class FXPyGLCone : public FXGLCone {
    FXDECLARE(FXPyGLCone)
public:
  FXPyGLCone(FXfloat x,FXfloat y,FXfloat z,FXfloat h=1.0f,FXfloat r=1.0f);
  FXPyGLCone(FXfloat x,FXfloat y,FXfloat z,FXfloat h,FXfloat r,const FXMaterial& mtl);
};
}
