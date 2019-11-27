/* FXVerticalFrame.i */

%pythonappend FX::FXVerticalFrame::FXVerticalFrame %{
  self.thisown = False
%}
%pythonappend FX::FXPyVerticalFrame::FXPyVerticalFrame %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXPACKER_H
#include "FXPacker.h"
#endif

namespace FX {


/**
* Vertical frame layout manager widget is used to automatically
* place child-windows vertically from top-to-bottom, or bottom-to-top,
* depending on the child window's layout hints.
*/
class FXVerticalFrame : public FXPacker {
public:

  /// Construct a vertical frame layout manager
  FXVerticalFrame(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);

  /// Perform layout
  virtual void layout();

  /// Return default width
  virtual FXint getDefaultWidth();

  /// Return default height
  virtual FXint getDefaultHeight();
  };

class FXPyVerticalFrame : public FXVerticalFrame {
    FXDECLARE(FXPyVerticalFrame)
public:
    FXPyVerticalFrame(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};
}
