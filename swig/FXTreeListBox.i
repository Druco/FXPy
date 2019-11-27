/* FXTreeListBox.i */

%pythonappend FX::FXTreeListBox::FXTreeListBox %{
  self.thisown = False
%}
%pythonappend FX::FXPyTreeListBox::FXPyTreeListBox %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTreeListBox.h"

namespace FX {
class FXPyTreeListBox : public FXTreeListBox {
    FXDECLARE(FXPyTreeListBox)
public:
    FXPyTreeListBox(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_SUNKEN|FRAME_THICK|TREELISTBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
