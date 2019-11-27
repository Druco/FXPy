/* FXDockHandler.i */

%pythonappend FX::FXDockHandler::FXDockHandler %{
  self.thisown = False
%}
%pythonappend FX::FXPyDockHandler::FXPyDockHandler %{
  self.thisown = False
  FXPyRegister(self)
%}


%include "include/fxdefs2.h"
%include "include/FXDockHandler.h"

namespace FX {
class FXPyDockHandler : public FXDockHandler {
    FXDECLARE(FXPyDockHandler)
protected:
    FXPyDockHandler(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb);
};

}
