/* FXDragCorner.i */

%pythonappend FX::FXDragCorner::FXDragCorner %{
  self.thisown = False
%}

#ifndef FXWINDOW_H
#include "FXWindow.h"
#endif

namespace FX {


/**
* A drag corner widget may be placed in the bottom right corner
* so as to allow the window to be resized more easily.
*/
class FXDragCorner : public FXWindow {
public:
  long onPaint(FXObject*,FXSelector,void*);
  long onLeftBtnPress(FXObject*,FXSelector,void*);
  long onLeftBtnRelease(FXObject*,FXSelector,void*);
  long onMotion(FXObject*,FXSelector,void*);
public:

  /// Construct a drag corner
  FXDragCorner(FXComposite* p);

  /// Get default width
  virtual FXint getDefaultWidth();

  /// Get default height
  virtual FXint getDefaultHeight();

  /// Create all of the server-side resources for this window
  virtual void create();

  /// Change highlight color
  void setHiliteColor(FXColor clr);

  /// Return current highlight color
  FXColor getHiliteColor() const { return hiliteColor; }

  /// Change shadow color
  void setShadowColor(FXColor clr);

  /// Return current shadow color
  FXColor getShadowColor() const { return shadowColor; }

  /// Save drag corner to a stream
  virtual void save(FXStream& store) const;

  /// Load drag corner from a stream
  virtual void load(FXStream& store);
  };

}
