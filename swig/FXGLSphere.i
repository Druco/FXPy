/* FXGLSphere.i */

%pythonappend FX::FXGLSphere::FXGLSphere %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLSphere::FXPyGLSphere %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLSphere.h"

namespace FX {
class FXPyGLSphere : public FXGLSphere {
public:
    FXPyGLSphere(FXfloat x,FXfloat y,FXfloat z,FXfloat r=1.0f);
    FXPyGLSphere(FXfloat x,FXfloat y,FXfloat z,FXfloat r,const FXMaterial& mtl);
};
}
