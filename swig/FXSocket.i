/* FXSocket.i */

%pythonappend FX::FXSocket::FXSocket %{
  self.thisown = False
%}
%pythonappend FX::FXPySocket::FXPySocket %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXSocket.h"


namespace FX {
class FXPySocket : public FXSocket {
public:
    FXPySocket();
    FXPySocket(FXInputHandle handle,FXuint mode);

};
}
