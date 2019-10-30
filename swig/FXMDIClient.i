/* FXMDIClient.i */

%pythonappend FX::FXMDIClient::FXMDIClient %{
  self.thisown = False
%}
%pythonappend FX::FXPyMDIClient::FXPyMDIClient %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMDIClient.h"

namespace FX {
class FXPyMDIClient : public FXMDIClient {
public:
    FXPyMDIClient(FXComposite* p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
