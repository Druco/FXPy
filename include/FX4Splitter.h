/********************************************************************************
*                                                                               *
*                       F o u r - W a y   S p l i t t e r                       *
*                                                                               *
*********************************************************************************
* Copyright (C) 1999,2006 by Jeroen van der Zijp.   All Rights Reserved.        *
*********************************************************************************
* This library is free software; you can redistribute it and/or                 *
* modify it under the terms of the GNU Lesser General Public                    *
* License as published by the Free Software Foundation; either                  *
* version 2.1 of the License, or (at your option) any later version.            *
*                                                                               *
* This library is distributed in the hope that it will be useful,               *
* but WITHOUT ANY WARRANTY; without even the implied warranty of                *
* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU             *
* Lesser General Public License for more details.                               *
*                                                                               *
* You should have received a copy of the GNU Lesser General Public              *
* License along with this library; if not, write to the Free Software           *
* Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA.    *
*********************************************************************************
* $Id: FX4Splitter.h,v 1.30 2006/02/20 03:32:12 fox Exp $                       *
********************************************************************************/
#ifndef FX4SPLITTER_H
#define FX4SPLITTER_H

#ifndef FXCOMPOSITE_H
#include "FXComposite.h"
#endif

namespace FX {

// Splitter options
enum {
  FOURSPLITTER_TRACKING = 0x00008000,	// Track continuously during split
  FOURSPLITTER_NORMAL   = 0
  };



/**
* The four-way splitter is a layout manager which manages
* four children like four panes in a window.
* You can use a four-way splitter for example in a CAD program
* where you may want to maintain three orthographic views, and
* one oblique view of a model.
* The four-way splitter allows interactive repartitioning of the
* panes by means of moving the central splitter bars.
* When the four-way splitter is itself resized, each child is
* proportionally resized, maintaining the same split-percentage.
* The four-way splitter widget sends a SEL_CHANGED to its target
* during the resizing of the panes; at the end of the resize interaction,
* it sends a SEL_COMMAND to signify that the resize operation is complete.
*/
class FX4Splitter : public FX::FXComposite {
  FXDECLARE(FX::FX4Splitter)
public:
private:
  FX::FXint     splitx;         // Current x split
  FX::FXint     splity;         // Current y split
  FX::FXint     barsize;        // Size of the splitter bar
  FX::FXint     fhor;           // Horizontal split fraction
  FX::FXint     fver;           // Vertical split fraction
  FX::FXint     offx;
  FX::FXint     offy;
  FX::FXuchar   mode;
protected:
  FX4Splitter();
  FX::FXuchar getMode(FX::FXint x,FX::FXint y);
  void moveSplit(FX::FXint x,FX::FXint y);
  void drawSplit(FX::FXint x,FX::FXint y,FX::FXuint m);
  void adjustLayout();
private:
  FX4Splitter(const FX::FX4Splitter&);
  FX4Splitter &operator=(const FX::FX4Splitter&);
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

  /// Create 4-way splitter, initially shown as four unexpanded panes
  FX4Splitter(FX::FXComposite* p,FX::FXuint opts=FOURSPLITTER_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);

  /// Create 4-way splitter, initially shown as four unexpanded panes; notifies target about size changes
  FX4Splitter(FX::FXComposite* p,FX::FXObject* tgt,FX::FXSelector sel,FX::FXuint opts=FOURSPLITTER_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);

  /// Get top left child, if any
  FX::FXWindow *getTopLeft() const;

  /// Get top right child, if any
  FX::FXWindow *getTopRight() const;

  /// Get bottom left child, if any
  FX::FXWindow *getBottomLeft() const;

  /// Get bottom right child, if any
  FX::FXWindow *getBottomRight() const;

  /// Get horizontal split fraction
  FX::FXint getHSplit() const { return fhor; }

  /// Get vertical split fraction
  FX::FXint getVSplit() const { return fver; }

  /// Change horizontal split fraction
  void setHSplit(FX::FXint s);

  /// Change vertical split fraction
  void setVSplit(FX::FXint s);

  /// Perform layout
  virtual void layout();

  /// Get default width
  virtual FX::FXint getDefaultWidth();

  /// Get default height
  virtual FX::FXint getDefaultHeight();

  /// Return current splitter style
  FX::FXuint getSplitterStyle() const;

  /// Change splitter style
  void setSplitterStyle(FX::FXuint style);

  /// Change splitter bar width
  void setBarSize(FX::FXint bs);

  /// Get splitter bar width
  FX::FXint getBarSize() const { return barsize; }

  /// Change set of expanded children
  void setExpanded(FX::FXuint set=FX::FX4Splitter::ExpandAll);

  /// Get set of expanded children
  FX::FXuint getExpanded() const;

  /// Save to stream
  virtual void save(FX::FXStream& store) const;

  /// Load from stream
  virtual void load(FX::FXStream& store);
  };

}

#endif
