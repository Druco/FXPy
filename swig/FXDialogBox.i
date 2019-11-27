/* FXDialogBox.i */

%pythonappend FX::FXDialogBox::FXDialogBox %{
  self.thisown = False
%}
%pythonappend FX::FXPyDialogBox::FXPyDialogBox %{
  self.thisown = False
  FXPyRegister(self)
%}


#ifndef FXTOPWINDOW_H
#include "FXTopWindow.h"
#endif

namespace FX {


/**
* DialogBox window.
* When receiving ID_CANCEL or ID_ACCEPT, the DialogBox breaks out of the
* modal loop and returns FALSE or TRUE, respectively.
* To close the DialogBox when not running modally, simply send it ID_HIDE.
*/
class FXDialogBox : public FXTopWindow {
protected:
    FXDialogBox();
public:
  long onKeyPress(FXObject*,FXSelector,void*);
  long onKeyRelease(FXObject*,FXSelector,void*);
  long onCmdAccept(FXObject*,FXSelector,void*);
  long onCmdCancel(FXObject*,FXSelector,void*);
public:
  enum {
    ID_CANCEL=FXTopWindow::ID_LAST,     /// Closes the dialog, cancel the entry
    ID_ACCEPT,                          /// Closes the dialog, accept the entry
    ID_LAST
    };
public:

  /// Construct free-floating dialog
  FXDialogBox(FXApp* a,const FXString& name,FXuint opts=DECOR_TITLE|DECOR_BORDER,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=4,FXint vs=4);

  /// Construct dialog which will always float over the owner window
  FXDialogBox(FXWindow* owner,const FXString& name,FXuint opts=DECOR_TITLE|DECOR_BORDER,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=4,FXint vs=4);

  /// Run modal invocation of the dialog
  virtual FXuint execute(FXuint placement=PLACEMENT_CURSOR);
  };

class FXPyDialogBox : public FXDialogBox {
    FXDECLARE(FXPyDialogBox)
public:
    FXPyDialogBox(FXApp* a,const FXString& name,FXuint opts=DECOR_TITLE|DECOR_BORDER,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=4,FXint vs=4);

    FXPyDialogBox(FXWindow* owner,const FXString& name,FXuint opts=DECOR_TITLE|DECOR_BORDER,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=4,FXint vs=4);
};

}
