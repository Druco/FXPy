/* FXMDIChild.i */

%pythonappend FX::FXMDIChild::FXMDIChild %{
  self.thisown = False
%}
%pythonappend FX::FXPyMDIChild::FXPyMDIChild %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMDIChild.h"

namespace FX {
class FXPyMDIChild : public FXMDIChild {
public:
    FXPyMDIChild(FXMDIClient* p,const FXString& name,FXIcon* ic=NULL,FXPopup* pup=NULL,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
