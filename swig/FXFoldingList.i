/* FXFoldingList.i */

%pythonappend FX::FXFoldingList::FXFoldingList %{
  self.thisown = False
%}
%pythonappend FX::FXPyFoldingList::FXPyFoldingList %{
  self.thisown = False
  FXPyRegister(self)
%}

%pythonappend FX::FXFoldingItem::FXFoldingItem %{
  self.thisown = False
%}
%pythonappend FX::FXPyFoldingItem::FXPyFoldingItem %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXFoldingList.h"

namespace FX {
class FXPyFoldingItem : public FXFoldingItem {
public:
    FXPyFoldingItem(const FXString& text,FXIcon* oi=NULL,FXIcon* ci=NULL,void* ptr=NULL);
};

class FXPyFoldingList : public FXFoldinglist {
    FXDECLARE(FXPyFoldingList)
protected:
  FXPyFoldingList();
public:
  /// Construct a folding list; the folding list is initially empty
  FXPyFoldingList(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FOLDINGLIST_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}

