/* FXGLCylinder.i */

%pythonappend FX::FXGLCylinder::FXGLCylinder %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLCylinder::FXPyGLCylinder %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLCylinder.h"

namespace FX {
class FXPyGLCylinder : public FXGLCylinder {
    FXDECLARE(FXPyGLCylinder)
public:
    FXPyGLCylinder(FXfloat x,FXfloat y,FXfloat z,FXfloat h=1.0f, FXfloat r=1.0f);
    FXPyGLCylinder(FXfloat x,FXfloat y,FXfloat z,FXfloat h,FXfloat r,const FXMaterial& mtl);
};
}
