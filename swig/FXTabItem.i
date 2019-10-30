/* FXTabItem.i */

%pythonappend FX::FXTabItem::FXTabItem %{
  self.thisown = False
%}
%pythonappend FX::FXPyTabItem::FXPyTabItem %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTabItem.h"

namespace FX {
class FXPyTabItem : public FXTabItem {
public:
    FXPyTabItem(FXTabBar* p,const FXString& text,FXIcon* ic=0,FXuint opts=TAB_TOP_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
