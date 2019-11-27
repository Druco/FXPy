/* FXHorizontalFrame.i */

%pythonappend FX::FXHorizontalFrame::FXHorizontalFrame %{
  self.thisown = False
%}
%pythonappend FX::FXPyHorizontalFrame::FXPyHorizontalFrame %{
  self.thisown = False
  FXPyRegister(self)
%}


#ifndef FXPACKER_H
#include "FXPacker.h"
#endif

namespace FX {


/**
* Horizontal frame layout manager widget is used to automatically
* place child-windows horizontally from left-to-right, or right-to-left,
* depending on the child window's layout hints.
*/
class FXHorizontalFrame : public FXPacker {
public:

  /// Construct a horizontal frame layout manager
  FXHorizontalFrame(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);

  /// Perform layout
  virtual void layout();

  /// Return default width
  virtual FXint getDefaultWidth();

  /// Return default height
  virtual FXint getDefaultHeight();
  };

class FXPyHorizontalFrame : public FXHorizontalFrame {
    FXDECLARE(FXPyHorizontalFrame)
public:
    FXPyHorizontalFrame(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

}
