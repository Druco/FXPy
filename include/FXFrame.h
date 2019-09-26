/********************************************************************************
*                                                                               *
*                       F r a m e   W i n d o w   W i d g e t                   *
*                                                                               *
*********************************************************************************
* Copyright (C) 1997,2006 by Jeroen van der Zijp.   All Rights Reserved.        *
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
* $Id: FXFrame.h,v 1.24 2006/01/22 17:58:02 fox Exp $                           *
********************************************************************************/
#ifndef FXFRAME_H
#define FXFRAME_H

#ifndef FXWINDOW_H
#include "FXWindow.h"
#endif

namespace FX {


/// Justification modes used by certain subclasses
enum {
  JUSTIFY_NORMAL       = 0,			      /// Default justification is centered text
  JUSTIFY_CENTER_X     = 0,			      /// Contents centered horizontally
  JUSTIFY_LEFT         = 0x00008000,		      /// Contents left-justified
  JUSTIFY_RIGHT        = 0x00010000,		      /// Contents right-justified
  JUSTIFY_HZ_APART     = JUSTIFY_LEFT|JUSTIFY_RIGHT,  /// Combination of JUSTIFY_LEFT & JUSTIFY_RIGHT
  JUSTIFY_CENTER_Y     = 0,			      /// Contents centered vertically
  JUSTIFY_TOP          = 0x00020000,		      /// Contents aligned with label top
  JUSTIFY_BOTTOM       = 0x00040000,		      /// Contents aligned with label bottom
  JUSTIFY_VT_APART     = JUSTIFY_TOP|JUSTIFY_BOTTOM   /// Combination of JUSTIFY_TOP & JUSTIFY_BOTTOM
  };


/// Default padding
enum { DEFAULT_PAD = 2 };


/**
* The Frame widget provides borders around some contents. Borders may be raised, sunken,
* thick, ridged or etched.  They can also be turned off completely.
* In addition, a certain amount of padding may be specified between the contents of
* the widget and the borders.  The contents may be justified inside the widget using the
* justification options.
* The Frame widget is sometimes used by itself as a place holder, but most often is used
* as a convenient base class for simple controls.
*/
class FXFrame : public FX::FXWindow {
  FXDECLARE(FX::FXFrame)
protected:
  FX::FXColor baseColor;    // Base color
  FX::FXColor hiliteColor;  // Highlight color
  FX::FXColor shadowColor;  // Shadow color
  FX::FXColor borderColor;  // Border color
  FX::FXint   padtop;       // Top padding
  FX::FXint   padbottom;    // Bottom padding
  FX::FXint   padleft;      // Left padding
  FX::FXint   padright;     // right padding
  FX::FXint   border;       // Border size
protected:
  FXFrame();
  void drawBorderRectangle(FX::FXDCWindow& dc,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  void drawRaisedRectangle(FX::FXDCWindow& dc,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  void drawSunkenRectangle(FX::FXDCWindow& dc,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  void drawRidgeRectangle(FX::FXDCWindow& dc,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  void drawGrooveRectangle(FX::FXDCWindow& dc,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  void drawDoubleRaisedRectangle(FX::FXDCWindow& dc,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  void drawDoubleSunkenRectangle(FX::FXDCWindow& dc,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  void drawFrame(FX::FXDCWindow& dc,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
private:
  FXFrame(const FX::FXFrame&);
  FXFrame &operator=(const FX::FXFrame&);
public:
  long onPaint(FX::FXObject*,FX::FXSelector,void*);
public:

  /// Construct frame window
  FXFrame(FX::FXComposite* p,FX::FXuint opts=FRAME_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0,FX::FXint pl=DEFAULT_PAD,FX::FXint pr=DEFAULT_PAD,FX::FXint pt=DEFAULT_PAD,FX::FXint pb=DEFAULT_PAD);

  /// Return default width
  virtual FX::FXint getDefaultWidth();

  /// Return default height
  virtual FX::FXint getDefaultHeight();

  /// Change frame style
  void setFrameStyle(FX::FXuint style);

  /// Get current frame style
  FX::FXuint getFrameStyle() const;

  /// Get border width
  FX::FXint getBorderWidth() const { return border; }

  /// Change top padding
  void setPadTop(FX::FXint pt);

  /// Get top interior padding
  FX::FXint getPadTop() const { return padtop; }

  /// Change bottom padding
  void setPadBottom(FX::FXint pb);

  /// Get bottom interior padding
  FX::FXint getPadBottom() const { return padbottom; }

  /// Change left padding
  void setPadLeft(FX::FXint pl);

  /// Get left interior padding
  FX::FXint getPadLeft() const { return padleft; }

  /// Change right padding
  void setPadRight(FX::FXint pr);

  /// Get right interior padding
  FX::FXint getPadRight() const { return padright; }

  /// Change highlight color
  void setHiliteColor(FX::FXColor clr);

  /// Get highlight color
  FX::FXColor getHiliteColor() const { return hiliteColor; }

  /// Change shadow color
  void setShadowColor(FX::FXColor clr);

  /// Get shadow color
  FX::FXColor getShadowColor() const { return shadowColor; }

  /// Change border color
  void setBorderColor(FX::FXColor clr);

  /// Get border color
  FX::FXColor getBorderColor() const { return borderColor; }

  /// Change base gui color
  void setBaseColor(FX::FXColor clr);

  /// Get base gui color
  FX::FXColor getBaseColor() const { return baseColor; }

  /// Save to stream
  virtual void save(FX::FXStream& store) const;

  /// Load from stream
  virtual void load(FX::FXStream& store);
  };

}

#endif
