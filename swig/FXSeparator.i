/* FXSeparator.i */

%pythonappend FX::FXSeparator::FXSeparator %{
  self.thisown = False
%}
%pythonappend FX::FXPySeparator::FXPySeparator %{
  self.thisown = False
  FXPyRegister(self)
%}

%pythonappend FX::FXHorizontalSeparator::FXHorizontalSeparator %{
  self.thisown = False
%}
%pythonappend FX::FXPyHorizontalSeparator::FXPyHorizontalSeparator %{
  self.thisown = False
%}

%pythonappend FX::FXVerticalSeparator::FXVerticalSeparator %{
  self.thisown = False
%}
%pythonappend FX::FXPyVerticalSeparator::FXPyVerticalSeparator %{
  self.thisown = False
%}

#ifndef FXFRAME_H
#include "FXFrame.h"
#endif

namespace FX {


/// Separator Options
enum {
  SEPARATOR_NONE       = 0,               /// Nothing visible
  SEPARATOR_GROOVE     = 0x00008000,      /// Etched-in looking groove
  SEPARATOR_RIDGE      = 0x00010000,      /// Embossed looking ridge
  SEPARATOR_LINE       = 0x00020000       /// Simple line
  };


class FXSeparator : public FXFrame {
public:
  long onPaint(FXObject*,FXSelector,void*);
public:

  /// Constructor
  FXSeparator(FXComposite* p,FXuint opts=SEPARATOR_GROOVE|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);

  /// Return default width
  virtual FXint getDefaultWidth();

  /// Return default height
  virtual FXint getDefaultHeight();

  /// Change separator style
  void setSeparatorStyle(FXuint style);

  /// Get separator style
  FXuint getSeparatorStyle() const;
  };



/// Horizontal separator widget
class FXHorizontalSeparator : public FXSeparator {
public:

  /// Constructor
  FXHorizontalSeparator(FXComposite* p,FXuint opts=SEPARATOR_GROOVE|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=1,FXint pr=1,FXint pt=0,FXint pb=0);
  };



/// Vertical separator widget
class FXVerticalSeparator : public FXSeparator {
public:

  /// Constructor
  FXVerticalSeparator(FXComposite* p,FXuint opts=SEPARATOR_GROOVE|LAYOUT_FILL_Y,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=1,FXint pb=1);
  };

class FXPySeparator : public FXSeparator {
public:
    FXPySeparator(FXComposite* p,FXuint opts=SEPARATOR_GROOVE|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};

class FXPyHorizontalSeparator : public FXHorizontalSeparator {
public:
    FXPyHorizontalSeparator(FXComposite* p,FXuint opts=SEPARATOR_GROOVE|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=1,FXint pr=1,FXint pt=0,FXint pb=0);
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};

class FXPyVerticalSeparator : public FXVerticalSeparator {
public:
    FXPyVerticalSeparator(FXComposite* p,FXuint opts=SEPARATOR_GROOVE|LAYOUT_FILL_Y,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=1,FXint pb=1);
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
