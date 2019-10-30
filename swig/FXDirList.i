/* FXDirList.i */

%pythonappend FX::FXDirItem::FXDirItem %{
  self.thisown = False
%}
%pythonappend FX::FXDirList::FXDirList %{
  self.thisown = False
%}
%pythonappend FX::FXPyDirItem::FXPyDirItem %{
  self.thisown = False
  FXPyRegister(self)
%}
%pythonappend FX::FXPyDirList::FXPyDirList %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXDirList.h"

namespace FX {
class FXPyDirItem : public FXDirItem {
public:
    FXPyDirItem(const FXString& text,FXIcon* oi=NULL,FXIcon* ci=NULL,void* ptr=NULL):FXTreeItem(text,oi,ci,ptr),assoc(NULL),link(NULL),list(NULL),size(0),date(0){state=HASITEMS;}
};

class FXPyDirList : public FXDirList {
public:
    FXPyDirList(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};

}
