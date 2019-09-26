/********************************************************************************
*                                                                               *
*                     A r r o w   B u t t o n   W i d g e t                     *
*                                                                               *
*********************************************************************************
* Copyright (C) 1998,2006 by Jeroen van der Zijp.   All Rights Reserved.        *
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
* $Id: FXArrowButton.h,v 1.39 2006/01/22 17:57:58 fox Exp $                     *
********************************************************************************/
#ifndef FXARROWBUTTON_H
#define FXARROWBUTTON_H

#ifndef FXFRAME_H
#include "FXFrame.h"
#endif

namespace FX {


// Arrow style options
enum {
  ARROW_NONE     = 0,		// No arrow
  ARROW_UP       = 0x00080000,	// Arrow points up
  ARROW_DOWN     = 0x00100000,	// Arrow points down
  ARROW_LEFT     = 0x00200000,	// Arrow points left
  ARROW_RIGHT    = 0x00400000,	// Arrow points right
  ARROW_AUTO     = 0x00800000,  // Automatically fire when hovering mouse over button
  ARROW_REPEAT   = 0x01000000,	// Button repeats if held down
  ARROW_AUTOGRAY = 0x02000000,	// Automatically gray out when not updated
  ARROW_AUTOHIDE = 0x04000000,	// Automatically hide when not updated
  ARROW_TOOLBAR  = 0x08000000,	// Button is toolbar-style
  ARROW_NORMAL   = FRAME_RAISED|FRAME_THICK|ARROW_UP
  };


/**
* Button with an arrow; the arrow can point in any direction.
* When clicked, the arrow button sends a SEL_COMMAND to its target.
* When ARROW_REPEAT is passed, the arrow button sends a SEL_COMMAND
* repeatedly while the button is pressed.
* The option ARROW_AUTO together with ARROW_REPEAT makes the arrow
* button work in repeat mode simply by hovering the cursor over it.
*/
class FXArrowButton : public FX::FXFrame {
  FXDECLARE(FX::FXArrowButton)
protected:
  FX::FXColor   arrowColor;     // Arrow color
  FX::FXint     arrowSize;      // Arrow size
  FX::FXString  tip;            // Tooltip value
  FX::FXString  help;           // Help value
  FX::FXbool    state;          // State of button
  FX::FXbool    fired;          // Timer has fired
protected:
  FXArrowButton();
private:
  FXArrowButton(const FX::FXArrowButton&);
  FXArrowButton &operator=(const FX::FXArrowButton&);
public:
  long onPaint(FX::FXObject*,FX::FXSelector,void*);
  long onUpdate(FX::FXObject*,FX::FXSelector,void*);
  long onEnter(FX::FXObject*,FX::FXSelector,void*);
  long onLeave(FX::FXObject*,FX::FXSelector,void*);
  long onLeftBtnPress(FX::FXObject*,FX::FXSelector,void*);
  long onLeftBtnRelease(FX::FXObject*,FX::FXSelector,void*);
  long onUngrabbed(FX::FXObject*,FX::FXSelector,void*);
  long onRepeat(FX::FXObject*,FX::FXSelector,void*);
  long onAuto(FX::FXObject*,FX::FXSelector,void*);
  long onKeyPress(FX::FXObject*,FX::FXSelector,void*);
  long onKeyRelease(FX::FXObject*,FX::FXSelector,void*);
  long onHotKeyPress(FX::FXObject*,FX::FXSelector,void*);
  long onHotKeyRelease(FX::FXObject*,FX::FXSelector,void*);
  long onCmdSetHelp(FX::FXObject*,FX::FXSelector,void*);
  long onCmdGetHelp(FX::FXObject*,FX::FXSelector,void*);
  long onCmdSetTip(FX::FXObject*,FX::FXSelector,void*);
  long onCmdGetTip(FX::FXObject*,FX::FXSelector,void*);
  long onQueryHelp(FX::FXObject*,FX::FXSelector,void*);
  long onQueryTip(FX::FXObject*,FX::FXSelector,void*);
public:
  enum {
    ID_REPEAT=FXFrame::ID_LAST,
    ID_AUTO,
    ID_LAST
    };
public:

  /// Construct arrow button
  FXArrowButton(FX::FXComposite* p,FX::FXObject* tgt=NULL,FX::FXSelector sel=0,FX::FXuint opts=ARROW_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0,FX::FXint pl=DEFAULT_PAD,FX::FXint pr=DEFAULT_PAD,FX::FXint pt=DEFAULT_PAD,FX::FXint pb=DEFAULT_PAD);

  /// Get default width
  virtual FX::FXint getDefaultWidth();

  /// Get default height
  virtual FX::FXint getDefaultHeight();

  /// Enable the button
  virtual void enable();

  /// Disable the button
  virtual void disable();

  /// Returns true because a button can receive focus
  virtual bool canFocus() const;

  /// Set the button state (where TRUE means the button is down)
  void setState(FX::FXbool s);

  /// Get the button state (where TRUE means the button is down)
  FX::FXbool getState() const { return state; }

  /// Set status line help text for this arrow button
  void setHelpText(const FX::FXString& text){ help=text; }

  /// Get status line help text for this arrow button
  const FX::FXString& getHelpText() const { return help; }

  /// Set tool tip message for this arrow button
  void setTipText(const FX::FXString& text){ tip=text; }

  /// Get tool tip message for this arrow button
  const FX::FXString& getTipText() const { return tip; }

  /// Set the arrow style flags
  void setArrowStyle(FX::FXuint style);

  /// Get the arrow style flags
  FX::FXuint getArrowStyle() const;

  /// Set the default arrow size
  void setArrowSize(FX::FXint size);

  /// Get the default arrow size
  FX::FXint getArrowSize() const { return arrowSize; }

  /// Set the current justification mode.
  void setJustify(FX::FXuint mode);

  /// Get the current justification mode.
  FX::FXuint getJustify() const;

  /// Get the fill color for the arrow
  FX::FXColor getArrowColor() const { return arrowColor; }

  /// Set the fill color for the arrow
  void setArrowColor(FX::FXColor clr);

  /// Save label to a stream
  virtual void save(FX::FXStream& store) const;

  /// Load label from a stream
  virtual void load(FX::FXStream& store);

  /// Destructor
  virtual ~FXArrowButton();
  };

}

#endif
