/* FXMenuCommand.i */

%pythonappend FX::FXMenuCommand::FXMenuCommand %{
  self.thisown = False
%}
%pythonappend FX::FXPyMenuCommand::FXPyMenuCommand %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXMenuCommand.h"

namespace FX {
class FXPyMenuCommand : public FXMenuCommand {
    FXDECLARE(FXPyMenuCommand)
public:
    FXPyMenuCommand(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0);
};
}
