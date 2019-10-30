/* FXMat3f.i */

%pythonappend FX::FXMat3f::FXMat3f %{
  self.thisown = False
%}
%pythonappend FX::FXPyMat3f::FXPyMat3f %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXMat3f.h"

namespace FX {
class FXPyMat3f : public FXMat3f {
public:
    FXPyMat3f(FXfloat w);
    FXPyMat3f(FXfloat a00,FXfloat a01,FXfloat a02,
              FXfloat a10,FXfloat a11,FXfloat a12,
              FXfloat a20,FXfloat a21,FXfloat a22);
    FXPyMat3f(const FXVec3f& a,const FXVec3f& b,const FXVec3f& c);
    FXPyMat3f(const FXQuatf& quat);
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
