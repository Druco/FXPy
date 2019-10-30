/* FXToolBarTab.i */

%pythonappend FX::FXToolBarTab::FXToolBarTab %{
  self.thisown = False
%}
%pythonappend FX::FXPyToolBarTab::FXPyToolBarTab %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXToolBarTab.h"

namespace FX {
class FXPyToolBarTab : public FXToolBarTab {
public:
    FXPyToolBarTab(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}
