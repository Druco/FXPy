/* FXMat4f.i */

%pythonappend FX::FXMat4f::FXMat4f %{
  self.thisown = False
%}
%pythonappend FX::FXPyMat4f::FXPyMat4f %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXMat4f.h"

namespace FX {
class FXPyMat4f : public FXMat4f {
public:
    FXMat4f();
    FXMat4f(FXfloat w);
    FXMat4f(FXfloat a00,FXfloat a01,FXfloat a02,FXfloat a03,
            FXfloat a10,FXfloat a11,FXfloat a12,FXfloat a13,
            FXfloat a20,FXfloat a21,FXfloat a22,FXfloat a23,
            FXfloat a30,FXfloat a31,FXfloat a32,FXfloat a33);
    FXMat4f(const FXVec4f& a,const FXVec4f& b,const FXVec4f& c,const FXVec4f& d);
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
