/* FXMainWindow.i */

%pythonappend FX::FXMainWindow::FXMainWindow %{
  self.thisown = False
%}

#ifndef FXTOPWINDOW_H
#include "FXTopWindow.h"
#endif

namespace FX {


/**
* The Main Window is usually the central window of an application.  Applications
* may have any number of main windows.
* When a MainWindow is closed, it sends a SEL_CLOSE message to its target; the target
* should return 0 if there is no objection against proceeding with the close, and
* return 1 otherwise.
* After the SEL_CLOSE message has been sent and no objection was raised, the main
* window will delete itself.
*/
class FXMainWindow : public FXTopWindow {
public:

  /// Construct a main window
  FXMainWindow(FXApp* a,const FXString& name,FXIcon *ic=NULL,FXIcon *mi=NULL,FXuint opts=DECOR_ALL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0,FXint hs=0,FXint vs=0);

  /// Create server-side resources
  virtual void create();

  /// Destructor
  virtual ~FXMainWindow();
  };

}
