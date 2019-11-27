/* FXTabBook.i */

%pythonappend FX::FXTabBook::FXTabBook %{
  self.thisown = False
%}
%pythonappend FX::FXPyTabBook::FXPyTabBook %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXTabBook.h"

namespace FX {
class FXPyTabBook : public FXTabBook {
    FXDECLARE(FXPyTabBook)
public:
    FXPyTabBook(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TABBOOK_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING);
};
}
