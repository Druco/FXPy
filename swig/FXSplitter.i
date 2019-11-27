/* FXSplitter.i */

%pythonappend FX::FXSplitter::FXSplitter %{
  self.thisown = False
%}
%pythonappend FX::FXPySplitter::FXPySplitter %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXSplitter.h"

namespace FX {
class FXPySplitter : public FXSplitter {
    FXDECLARE(FXPySplitter)
public:
    FXPySplitter(FXComposite* p,FXuint opts=SPLITTER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
    FXPySplitter(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts=SPLITTER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

};
}
