/* FX4Splitter.i */

%pythonappend FX::FX4Splitter::FX4Splitter %{
  self.thisown = False
%}
%pythonappend FX::FXPy4Splitter::FXPy4Splitter %{
  self.thisown = False
  FXPyRegister(self)
%}

#define __GNUC__
%module FX4Splitter

%include "include/fxdefs2.h"

#ifndef FXCOMPOSITE_H
#include "FXComposite.h"
#endif

namespace FX {

// Splitter options
enum {
  FOURSPLITTER_TRACKING = 0x00008000,	// Track continuously during split
  FOURSPLITTER_NORMAL   = 0
  };

class FX4Splitter : public FX::FXComposite {
public:
  long onLeftBtnPress(FX::FXObject*,FX::FXSelector,void*);
  long onLeftBtnRelease(FX::FXObject*,FX::FXSelector,void*);
  long onMotion(FX::FXObject*,FX::FXSelector,void*);
  long onFocusUp(FX::FXObject*,FX::FXSelector,void*);
  long onFocusDown(FX::FXObject*,FX::FXSelector,void*);
  long onFocusLeft(FX::FXObject*,FX::FXSelector,void*);
  long onFocusRight(FX::FXObject*,FX::FXSelector,void*);
  long onCmdExpand(FX::FXObject*,FX::FXSelector,void*);
  long onUpdExpand(FX::FXObject*,FX::FXSelector,void*);
public:
  enum {
    ExpandNone        = 0,                                  /// None expanded
    ExpandTopLeft     = 1,                                  /// Expand top left child
    ExpandTopRight    = 2,                                  /// Expand top right child
    ExpandBottomLeft  = 4,                                  /// Expand bottom left child
    ExpandBottomRight = 8,                                  /// Expand bottom right child
    ExpandTop         = ExpandTopLeft|ExpandTopRight,       /// Expand top children
    ExpandBottom      = ExpandBottomLeft|ExpandBottomRight, /// Expand bottom children
    ExpandLeft        = ExpandTopLeft|ExpandBottomLeft,     /// Expand left children
    ExpandRight       = ExpandTopRight|ExpandBottomRight,   /// Expand right children
    ExpandAll         = ExpandLeft|ExpandRight              /// Expand all children
    };
public:
  enum {
    ID_EXPAND_NONE=FX::FXComposite::ID_LAST+ExpandNone,
    ID_EXPAND_TOP=ID_EXPAND_NONE+ExpandTop,
    ID_EXPAND_BOTTOM=ID_EXPAND_NONE+ExpandBottom,
    ID_EXPAND_LEFT=ID_EXPAND_NONE+ExpandLeft,
    ID_EXPAND_RIGHT=ID_EXPAND_NONE+ExpandRight,
    ID_EXPAND_TOPLEFT=ID_EXPAND_NONE+ExpandTopLeft,
    ID_EXPAND_TOPRIGHT=ID_EXPAND_NONE+ExpandTopRight,
    ID_EXPAND_BOTTOMLEFT=ID_EXPAND_NONE+ExpandBottomLeft,
    ID_EXPAND_BOTTOMRIGHT=ID_EXPAND_NONE+ExpandBottomRight,
    ID_EXPAND_ALL=ID_EXPAND_NONE+ExpandAll,
    ID_LAST
    };
public:

  FX4Splitter(FX::FXComposite* p,FX::FXuint opts=FOURSPLITTER_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);
  FX4Splitter(FX::FXComposite* p,FX::FXObject* tgt,FX::FXSelector sel,FX::FXuint opts=FOURSPLITTER_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);
  FX::FXWindow *getTopLeft() const;
  FX::FXWindow *getTopRight() const;
  FX::FXWindow *getBottomLeft() const;
  FX::FXWindow *getBottomRight() const;
  FX::FXint getHSplit() const { return fhor; }
  FX::FXint getVSplit() const { return fver; }
  void setHSplit(FX::FXint s);
  void setVSplit(FX::FXint s);
  FX::FXuint getSplitterStyle() const;
  void setSplitterStyle(FX::FXuint style);
  void setBarSize(FX::FXint bs);
  FX::FXint getBarSize() const { return barsize; }
  void setExpanded(FX::FXuint set=FX::FX4Splitter::ExpandAll);
  FX::FXuint getExpanded() const;
  };

class FXPy4Splitter : public FX4Splitter {
public:
  // Constructor
  FXPy4Splitter(FX::FXComposite* p,FX::FXuint opts=FOURSPLITTER_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);
  FXPy4Splitter(FX::FXComposite* p,FX::FXObject* tgt,FX::FXSelector sel,FX::FXuint opts=FOURSPLITTER_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);
};
}
