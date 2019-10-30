/* FXColorList.i */

%pythonappend FX::FXColorList::FXColorList %{
  self.thisown = False
%}
%pythonappend FX::FXPyColorList::FXPyColorList %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXColorList.h"

namespace FX {
class FXPyColorList : FXColorList {
public:
  FXColorList(FX::FXComposite *p,FX::FXObject* tgt=NULL,FX::FXSelector sel=0,FX::FXuint opts=LIST_BROWSESELECT,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);
};

}
