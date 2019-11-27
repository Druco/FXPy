/* FXScrollBar.i */

%pythonappend FX::FXScrollBar::FXScrollBar %{
  self.thisown = False
%}
%pythonappend FX::FXPyScrollBar::FXPyScrollBar %{
  self.thisown = False
  FXPyRegister(self)
%}
%pythonappend FX::FXScrollCorner::FXScrollCorner %{
  self.thisown = False
%}
%pythonappend FX::FXPyScrollCorner::FXPyScrollCorner %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXScrollBar.h"

namespace FX {
class FXPyScrollBar : public FXScrollBar {
public:
    FXPyScrollBar(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=SCROLLBAR_VERTICAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};
}

namespace FX {
class FXPyScrollCorner : public FXScrollCorner {
    FXDECLARE(FXPyScrollCorner)
public:
    FXPyScrollCorner(FXComposite* p);
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
