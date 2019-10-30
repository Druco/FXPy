/* FXTreeList.i */

%pythonappend FX::FXTreeItem::FXTreeItem %{
  self.thisown = False
%}
%pythonappend FX::FXPyTreeItem::FXPyTreeItem %{
  self.thisown = False
  FXPyRegister(self)
%}

%pythonappend FX::FXTreeList::FXTreeList %{
  self.thisown = False
%}
%pythonappend FX::FXPyTreeList::FXPyTreeList %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXTreeList.h"

namespace FX {
class FXPyTreeItem : public FXTreeItem {
public:
    FXPyTreeItem(const FXString& text,FXIcon* oi=NULL,FXIcon* ci=NULL,void* ptr=NULL);

};
}

namespace FX {
class FXPyTreeList : public FXTreeList {
public:
    FXPyTreeList(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TREELIST_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
