/* FXComposite.i */

%pythonappend FX::FXComposite::FXComposite %{
  self.thisown = False
%}

#ifndef FXWINDOW_H
#include "FXWindow.h"
#endif

namespace FX {


/// Base composite
class FXComposite : public FXWindow {
public:
  long onKeyPress(FX::FXObject*,FX::FXSelector,void*);
  long onKeyRelease(FX::FXObject*,FX::FXSelector,void*);
  long onFocusNext(FX::FXObject*,FX::FXSelector,void*);
  long onFocusPrev(FX::FXObject*,FX::FXSelector,void*);
  long onCmdUpdate(FX::FXObject*,FX::FXSelector,void*);
public:

  /// Constructor
  FXComposite(FX::FXComposite* p,FX::FXuint opts=0,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);

  /// Create server-side resources
  virtual void create();

  /// Detach server-side resources
  virtual void detach();

  /// Destroy server-side resources
  virtual void destroy();

  /// Perform layout
  virtual void layout();

  /// Return default width
  virtual FX::FXint getDefaultWidth();

  /// Return default height
  virtual FX::FXint getDefaultHeight();

  /// Return the width of the widest child window
  FX::FXint maxChildWidth() const;

  /// Return the height of the tallest child window
  FX::FXint maxChildHeight() const;

  /// Overrides this virtual function to return TRUE
  virtual bool isComposite() const;

  /// Destructor
  virtual ~FXComposite();
  };

}
