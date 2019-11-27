/* FXDockTitle.i */

%pythonappend FX::FXDockTitle::FXDockTitle %{
  self.thisown = False
%}
%pythonappend FX::FXPyDockTitle::FXPyDockTitle %{
  self.thisown = False
  FXPyRegister(self)
%}


%include "include/fxdefs2.h"
%include "include/FXDockTitle.h"

namespace FX {
class FXPyDockTitle : public FXDockTitle {
    FXDECLARE(FXPyDockTitle)
public:
    FXPyDockTitle(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL|JUSTIFY_CENTER_X|JUSTIFY_CENTER_Y,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};
}
