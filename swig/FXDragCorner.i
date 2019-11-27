/* FXDragCorner.i */

%pythonappend FX::FXDragCorner::FXDragCorner %{
  self.thisown = False
%}
%pythonappend FX::FXPyDragCorner::FXPyDragCorner %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXWINDOW_H
#include "FXWindow.h"
#endif

namespace FX {

class FXDragCorner : public FXWindow {
    FXDECLARE(FXPyRegister)
public:
  long onPaint(FXObject*,FXSelector,void*);
  long onLeftBtnPress(FXObject*,FXSelector,void*);
  long onLeftBtnRelease(FXObject*,FXSelector,void*);
  long onMotion(FXObject*,FXSelector,void*);
public:

  FXDragCorner(FXComposite* p);

  void setHiliteColor(FXColor clr);
  FXColor getHiliteColor() const { return hiliteColor; }
  void setShadowColor(FXColor clr);
  FXColor getShadowColor() const { return shadowColor; }
  };

class FXPyDragCorner : public FXDragCorner {
public:
    FXPyDragCorner(FXComposite* p);
};


}
