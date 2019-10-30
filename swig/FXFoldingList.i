/* FXFoldingList.i */

%pythonappend FX::FXFoldingList::FXFoldingList %{
  self.thisown = False
%}
%pythonappend FX::FXPyFoldingList::FXPyFoldingList %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXFoldingList.h"

namespace FX {
class FXPyFoldingList : public FXFoldingList {
public:
    FXFoldingItem(const FXString& text,FXIcon* oi=NULL,FXIcon* ci=NULL,void* ptr=NULL);
};
}

