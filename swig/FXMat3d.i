/* FXMat3d.i */

%pythonappend FX::FXMat3d::FXMat3d %{
  self.thisown = False
%}
%pythonappend FX::FXPyMat3d::FXPyMat3d %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXMat3d.h"

namespace FX {
class FXPyMat3d : public FXMat3d {
public:
    FXPyMat3d();
    FXPyMat3d(FXdouble w);
    FXPyMat3d(FXdouble a00,FXdouble a01,FXdouble a02,
              FXdouble a10,FXdouble a11,FXdouble a12,
              FXdouble a20,FXdouble a21,FXdouble a22);
    FXPyMat3d(const FXVec3d& a,const FXVec3d& b,const FXVec3d& c);
    FXPyMat3d(const FXQuatd& quat);
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
