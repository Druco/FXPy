/* FXGLTriangleMesh.i */

%pythonappend FX::FXGLTriangleMesh::FXGLTriangleMesh %{
  self.thisown = False
%}
%pythonappend FX::FXPyGLTriangleMesh::FXPyGLTriangleMesh %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGLTriangleMesh.h"

namespace FX {
class FXPyGLTriangleMesh : public FXGLTriangleMesh {
    FXDECLARE(FXPyGLTriangleMesh)
public:
    FXPyGLTriangleMesh(FXfloat x,FXfloat y,FXfloat z,FXint nv,FXfloat *v,FXfloat *n=NULL,FXfloat *c=NULL,FXfloat *t=NULL);
    FXPyGLTriangleMesh(FXfloat x,FXfloat y,FXfloat z,FXint nv,FXfloat *v,FXfloat *n,FXfloat *c,FXfloat *t,const FXMaterial& mtl);
};
}
