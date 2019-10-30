/* FXMat4d.i */

%pythonappend FX::FXMat4d::FXMat4d %{
  self.thisown = False
%}
%pythonappend FX::FXPyMat4d::FXPyMat4d %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXMat4d.h"

namespace FX {
class FXPyMat4d : public FXMat4d {
public:
    FXPyMat4d(){}
    FXPyMat4d(FXdouble w);
    FXPyMat4d(FXdouble a00,FXdouble a01,FXdouble a02,FXdouble a03,
              FXdouble a10,FXdouble a11,FXdouble a12,FXdouble a13,
              FXdouble a20,FXdouble a21,FXdouble a22,FXdouble a23,
              FXdouble a30,FXdouble a31,FXdouble a32,FXdouble a33);
    FXPyMat4d(const FXVec4d& a,const FXVec4d& b,const FXVec4d& c,const FXVec4d& d);
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
