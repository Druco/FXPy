/* FXGUISignal.i */

%pythonappend FX::FXGUISignal::FXGUISignal %{
  self.thisown = False
%}
%pythonappend FX::FXPyGUISignal::FXPyGUISignal %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXGUISignal.h"

namespace FX {
class FXPyGUISignal : public FXGUISignal {
public:
    FXPyGUISignal(FXApp* a,FXObject* tgt=NULL,FXSelector sel=0,void* ptr=NULL);
};
}
