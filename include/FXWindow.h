/********************************************************************************
*                                                                               *
*                            W i n d o w   O b j e c t                          *
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
* $Id: FXWindow.h,v 1.149 2006/01/22 17:58:12 fox Exp $                         *
********************************************************************************/
#ifndef FXWINDOW_H
#define FXWINDOW_H

#ifndef FXDRAWABLE_H
#include "FXDrawable.h"
#endif


namespace FX {


/// Layout hints for child widgets
enum {
  LAYOUT_NORMAL      = 0,                                   /// Default layout mode
  LAYOUT_SIDE_TOP    = 0,                                   /// Pack on top side (default)
  LAYOUT_SIDE_BOTTOM = 0x00000001,                          /// Pack on bottom side
  LAYOUT_SIDE_LEFT   = 0x00000002,                          /// Pack on left side
  LAYOUT_SIDE_RIGHT  = LAYOUT_SIDE_LEFT|LAYOUT_SIDE_BOTTOM, /// Pack on right side
  LAYOUT_FILL_COLUMN = 0x00000001,                          /// Matrix column is stretchable
  LAYOUT_FILL_ROW    = 0x00000002,                          /// Matrix row is stretchable
  LAYOUT_LEFT        = 0,                                   /// Stick on left (default)
  LAYOUT_RIGHT       = 0x00000004,                          /// Stick on right
  LAYOUT_CENTER_X    = 0x00000008,                          /// Center horizontally
  LAYOUT_FIX_X       = LAYOUT_RIGHT|LAYOUT_CENTER_X,        /// X fixed
  LAYOUT_TOP         = 0,                                   /// Stick on top (default)
  LAYOUT_BOTTOM      = 0x00000010,                          /// Stick on bottom
  LAYOUT_CENTER_Y    = 0x00000020,                          /// Center vertically
  LAYOUT_FIX_Y       = LAYOUT_BOTTOM|LAYOUT_CENTER_Y,       /// Y fixed
  LAYOUT_DOCK_SAME   = 0,                                   /// Dock on same galley if it fits
  LAYOUT_DOCK_NEXT   = 0x00000040,                          /// Dock on next galley
  LAYOUT_RESERVED_1  = 0x00000080,
  LAYOUT_FIX_WIDTH   = 0x00000100,                          /// Width fixed
  LAYOUT_FIX_HEIGHT  = 0x00000200,                          /// height fixed
  LAYOUT_MIN_WIDTH   = 0,                                   /// Minimum width is the default
  LAYOUT_MIN_HEIGHT  = 0,                                   /// Minimum height is the default
  LAYOUT_FILL_X      = 0x00000400,                          /// Stretch or shrink horizontally
  LAYOUT_FILL_Y      = 0x00000800,                          /// Stretch or shrink vertically
  LAYOUT_FILL        = LAYOUT_FILL_X|LAYOUT_FILL_Y,         /// Stretch or shrink in both directions
  LAYOUT_EXPLICIT    = LAYOUT_FIX_X|LAYOUT_FIX_Y|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT   /// Explicit placement
  };


/// Frame border appearance styles (for subclasses)
enum {
  FRAME_NONE   = 0,                                     /// Default is no frame
  FRAME_SUNKEN = 0x00001000,                            /// Sunken border
  FRAME_RAISED = 0x00002000,                            /// Raised border
  FRAME_THICK  = 0x00004000,                            /// Thick border
  FRAME_GROOVE = FRAME_THICK,                           /// A groove or etched-in border
  FRAME_RIDGE  = FRAME_THICK|FRAME_RAISED|FRAME_SUNKEN, /// A ridge or embossed border
  FRAME_LINE   = FRAME_RAISED|FRAME_SUNKEN,             /// Simple line border
  FRAME_NORMAL = FRAME_SUNKEN|FRAME_THICK               /// Regular raised/thick border
  };


/// Packing style (for packers)
enum {
  PACK_NORMAL         = 0,              /// Default is each its own size
  PACK_UNIFORM_HEIGHT = 0x00008000,     /// Uniform height
  PACK_UNIFORM_WIDTH  = 0x00010000      /// Uniform width
  };


class FXIcon;
class FXBitmap;
class FXCursor;
class FXRegion;
class FXComposite;
class FXAccelTable;
class FXComposeContext;


/// Base class for all windows
class FXWindow : public FX::FXDrawable {
  FXDECLARE(FX::FXWindow)
  friend class FX::FXApp;
private:
  FX::FXWindow         *parent;             // Parent Window
  FX::FXWindow         *owner;              // Owner Window
  FX::FXWindow         *first;              // First Child
  FX::FXWindow         *last;               // Last Child
  FX::FXWindow         *next;               // Next Sibling
  FX::FXWindow         *prev;               // Previous Sibling
  FX::FXWindow         *focus;              // Focus Child
  FX::FXuint            wk;                 // Window Key
protected:
  FX::FXComposeContext *composeContext;     // Compose context
  FX::FXCursor         *defaultCursor;      // Normal Cursor
  FX::FXCursor         *dragCursor;         // Cursor during drag
  FX::FXAccelTable     *accelTable;         // Accelerator table
  FX::FXObject         *target;             // Target object
  FX::FXSelector        message;            // Message ID
  FX::FXint             xpos;               // Window X Position
  FX::FXint             ypos;               // Window Y Position
  FX::FXColor           backColor;          // Window background color
  FX::FXString          tag;                // Help tag
  FX::FXuint            flags;              // Window state flags
  FX::FXuint            options;            // Window options
public:
  static FX::FXDragType octetType;          // Raw octet stream
  static FX::FXDragType deleteType;         // Delete request
  static FX::FXDragType textType;           // Ascii text request
  static FX::FXDragType utf8Type;           // UTF-8 text request
  static FX::FXDragType utf16Type;          // UTF-16 text request
  static FX::FXDragType colorType;          // Color
  static FX::FXDragType urilistType;        // URI List
  static const FX::FXDragType stringType;   // Clipboard text type (pre-registered)
  static const FX::FXDragType imageType;    // Clipboard image type (pre-registered)
protected:
  FXWindow();
  FXWindow(FX::FXApp* a,FX::FXVisual *vis);
  FXWindow(FX::FXApp* a,FX::FXWindow* own,FX::FXuint opts,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  static FX::FXWindow* findDefault(FX::FXWindow* window);
  static FX::FXWindow* findInitial(FX::FXWindow* window);
  virtual bool doesOverrideRedirect() const;
protected:
#ifdef WIN32
  virtual FX::FXID GetDC() const;
  virtual int ReleaseDC(FX::FXID) const;
  virtual const char* GetClass() const;
#else
  void addColormapWindows();
  void remColormapWindows();
#endif
private:
  FXWindow(const FX::FXWindow&);
  FXWindow& operator=(const FX::FXWindow&);
protected:

  // Window state flags
  enum {
    FLAG_SHOWN        = 0x00000001,     // Is shown
    FLAG_ENABLED      = 0x00000002,     // Able to receive input
    FLAG_UPDATE       = 0x00000004,     // Is subject to GUI update
    FLAG_DROPTARGET   = 0x00000008,     // Drop target
    FLAG_FOCUSED      = 0x00000010,     // Has focus
    FLAG_DIRTY        = 0x00000020,     // Needs layout
    FLAG_RECALC       = 0x00000040,     // Needs recalculation
    FLAG_TIP          = 0x00000080,     // Show tip
    FLAG_HELP         = 0x00000100,     // Show help
    FLAG_DEFAULT      = 0x00000200,     // Default widget
    FLAG_INITIAL      = 0x00000400,     // Initial widget
    FLAG_SHELL        = 0x00000800,     // Shell window
    FLAG_ACTIVE       = 0x00001000,     // Window is active
    FLAG_PRESSED      = 0x00002000,     // Button has been pressed
    FLAG_KEY          = 0x00004000,     // Keyboard key pressed
    FLAG_CARET        = 0x00008000,     // Caret is on
    FLAG_CHANGED      = 0x00010000,     // Window data changed
    FLAG_LASSO        = 0x00020000,     // Lasso mode
    FLAG_TRYDRAG      = 0x00040000,     // Tentative drag mode
    FLAG_DODRAG       = 0x00080000,     // Doing drag mode
    FLAG_SCROLLINSIDE = 0x00100000,     // Scroll only when inside
    FLAG_SCROLLING    = 0x00200000,     // Right mouse scrolling
    FLAG_OWNED        = 0x00400000
    };

public:

  // Message handlers
  long onPaint(FX::FXObject*,FX::FXSelector,void*);
  long onMap(FX::FXObject*,FX::FXSelector,void*);
  long onUnmap(FX::FXObject*,FX::FXSelector,void*);
  long onConfigure(FX::FXObject*,FX::FXSelector,void*);
  long onUpdate(FX::FXObject*,FX::FXSelector,void*);
  long onMotion(FX::FXObject*,FX::FXSelector,void*);
  long onMouseWheel(FX::FXObject*,FX::FXSelector,void*);
  long onEnter(FX::FXObject*,FX::FXSelector,void*);
  long onLeave(FX::FXObject*,FX::FXSelector,void*);
  long onLeftBtnPress(FX::FXObject*,FX::FXSelector,void*);
  long onLeftBtnRelease(FX::FXObject*,FX::FXSelector,void*);
  long onMiddleBtnPress(FX::FXObject*,FX::FXSelector,void*);
  long onMiddleBtnRelease(FX::FXObject*,FX::FXSelector,void*);
  long onRightBtnPress(FX::FXObject*,FX::FXSelector,void*);
  long onRightBtnRelease(FX::FXObject*,FX::FXSelector,void*);
  long onBeginDrag(FX::FXObject*,FX::FXSelector,void*);
  long onEndDrag(FX::FXObject*,FX::FXSelector,void*);
  long onDragged(FX::FXObject*,FX::FXSelector,void*);
  long onKeyPress(FX::FXObject*,FX::FXSelector,void*);
  long onKeyRelease(FX::FXObject*,FX::FXSelector,void*);
  long onUngrabbed(FX::FXObject*,FX::FXSelector,void*);
  long onDestroy(FX::FXObject*,FX::FXSelector,void*);
  long onFocusSelf(FX::FXObject*,FX::FXSelector,void*);
  long onFocusIn(FX::FXObject*,FX::FXSelector,void*);
  long onFocusOut(FX::FXObject*,FX::FXSelector,void*);
  long onSelectionLost(FX::FXObject*,FX::FXSelector,void*);
  long onSelectionGained(FX::FXObject*,FX::FXSelector,void*);
  long onSelectionRequest(FX::FXObject*,FX::FXSelector,void*);
  long onClipboardLost(FX::FXObject*,FX::FXSelector,void*);
  long onClipboardGained(FX::FXObject*,FX::FXSelector,void*);
  long onClipboardRequest(FX::FXObject*,FX::FXSelector,void*);
  long onDNDEnter(FX::FXObject*,FX::FXSelector,void*);
  long onDNDLeave(FX::FXObject*,FX::FXSelector,void*);
  long onDNDMotion(FX::FXObject*,FX::FXSelector,void*);
  long onDNDDrop(FX::FXObject*,FX::FXSelector,void*);
  long onDNDRequest(FX::FXObject*,FX::FXSelector,void*);
  long onQueryHelp(FX::FXObject*,FX::FXSelector,void*);
  long onQueryTip(FX::FXObject*,FX::FXSelector,void*);
  long onCmdShow(FX::FXObject*,FX::FXSelector,void*);
  long onCmdHide(FX::FXObject*,FX::FXSelector,void*);
  long onUpdToggleShown(FX::FXObject*,FX::FXSelector,void*);
  long onCmdToggleShown(FX::FXObject*,FX::FXSelector,void*);
  long onCmdRaise(FX::FXObject*,FX::FXSelector,void*);
  long onCmdLower(FX::FXObject*,FX::FXSelector,void*);
  long onCmdEnable(FX::FXObject*,FX::FXSelector,void*);
  long onCmdDisable(FX::FXObject*,FX::FXSelector,void*);
  long onUpdToggleEnabled(FX::FXObject*,FX::FXSelector,void*);
  long onCmdToggleEnabled(FX::FXObject*,FX::FXSelector,void*);
  long onCmdUpdate(FX::FXObject*,FX::FXSelector,void*);
  long onUpdYes(FX::FXObject*,FX::FXSelector,void*);
  long onCmdDelete(FX::FXObject*,FX::FXSelector,void*);

public:

  // Message ID's common to most Windows
  enum {
    ID_NONE,
    ID_HIDE,            // ID_HIDE+FALSE
    ID_SHOW,            // ID_HIDE+TRUE
    ID_TOGGLESHOWN,
    ID_LOWER,
    ID_RAISE,
    ID_DELETE,
    ID_DISABLE,         // ID_DISABLE+FALSE
    ID_ENABLE,          // ID_DISABLE+TRUE
    ID_TOGGLEENABLED,
    ID_UNCHECK,         // ID_UNCHECK+FALSE
    ID_CHECK,           // ID_UNCHECK+TRUE
    ID_UNKNOWN,         // ID_UNCHECK+MAYBE
    ID_UPDATE,
    ID_AUTOSCROLL,
    ID_TIPTIMER,
    ID_HSCROLLED,
    ID_VSCROLLED,
    ID_SETVALUE,
    ID_SETINTVALUE,
    ID_SETREALVALUE,
    ID_SETSTRINGVALUE,
    ID_SETICONVALUE,
    ID_SETINTRANGE,
    ID_SETREALRANGE,
    ID_GETINTVALUE,
    ID_GETREALVALUE,
    ID_GETSTRINGVALUE,
    ID_GETICONVALUE,
    ID_GETINTRANGE,
    ID_GETREALRANGE,
    ID_SETHELPSTRING,
    ID_GETHELPSTRING,
    ID_SETTIPSTRING,
    ID_GETTIPSTRING,
    ID_QUERY_MENU,
    ID_HOTKEY,
    ID_ACCEL,
    ID_UNPOST,
    ID_POST,
    ID_MDI_TILEHORIZONTAL,
    ID_MDI_TILEVERTICAL,
    ID_MDI_CASCADE,
    ID_MDI_MAXIMIZE,
    ID_MDI_MINIMIZE,
    ID_MDI_RESTORE,
    ID_MDI_CLOSE,
    ID_MDI_WINDOW,
    ID_MDI_MENUWINDOW,
    ID_MDI_MENUMINIMIZE,
    ID_MDI_MENURESTORE,
    ID_MDI_MENUCLOSE,
    ID_MDI_NEXT,
    ID_MDI_PREV,
    ID_LAST
    };

public:

  // Common DND type names
  static const FX::FXchar octetTypeName[];
  static const FX::FXchar deleteTypeName[];
  static const FX::FXchar textTypeName[];
  static const FX::FXchar colorTypeName[];
  static const FX::FXchar urilistTypeName[];
  static const FX::FXchar utf8TypeName[];
  static const FX::FXchar utf16TypeName[];

public:

  /// Constructor
  FXWindow(FX::FXComposite* p,FX::FXuint opts=0,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);

  /// Return a pointer to the parent window
  FX::FXWindow* getParent() const { return parent; }

  /// Return a pointer to the owner window
  FX::FXWindow* getOwner() const { return owner; }

  /// Return a pointer to the shell window
  FX::FXWindow* getShell() const;

  /// Return a pointer to the root window
  FX::FXWindow* getRoot() const;

  /// Return a pointer to the next (sibling) window, if any
  FX::FXWindow* getNext() const { return next; }

  /// Return a pointer to the previous (sibling) window , if any
  FX::FXWindow* getPrev() const { return prev; }

  /// Return a pointer to this window's first child window , if any
  FX::FXWindow* getFirst() const { return first; }

  /// Return a pointer to this window's last child window, if any
  FX::FXWindow* getLast() const { return last; }

  /// Return a pointer to the currently focused child window
  FX::FXWindow* getFocus() const { return focus; }

  /// Change window key
  void setKey(FX::FXuint k){ wk=k; }

  /// Return window key
  FX::FXuint getKey() const { return wk; }

  /// Set the message target object for this window
  void setTarget(FX::FXObject *t){ target=t; }

  /// Get the message target object for this window, if any
  FX::FXObject* getTarget() const { return target; }

  /// Set the message identifier for this window
  void setSelector(FX::FXSelector sel){ message=sel; }

  /// Get the message identifier for this window
  FX::FXSelector getSelector() const { return message; }

  /// Get this window's x-coordinate, in the parent's coordinate system
  FX::FXint getX() const { return xpos; }

  /// Get this window's y-coordinate, in the parent's coordinate system
  FX::FXint getY() const { return ypos; }

  /// Return the default width of this window
  virtual FX::FXint getDefaultWidth();

  /// Return the default height of this window
  virtual FX::FXint getDefaultHeight();

  /// Return width for given height
  virtual FX::FXint getWidthForHeight(FX::FXint givenheight);

  /// Return height for given width
  virtual FX::FXint getHeightForWidth(FX::FXint givenwidth);

  /// Set this window's x-coordinate, in the parent's coordinate system
  void setX(FX::FXint x);

  /// Set this window's y-coordinate, in the parent's coordinate system
  void setY(FX::FXint y);

  /**
  * Set the window width; and flag the widget as being in need of
  * layout by its parent.  This does not immediately update the server-
  * side representation of the widget.
  */
  void setWidth(FX::FXint w);

  /**
  * Set the window height; and flag the widget as being in need of
  * layout by its parent.  This does not immediately update the server-
  * side representation of the widget.
  */
  void setHeight(FX::FXint h);

  /// Set layout hints for this window
  void setLayoutHints(FX::FXuint lout);

  /// Get layout hints for this window
  FX::FXuint getLayoutHints() const;

  /// Return a pointer to the accelerator table
  FX::FXAccelTable* getAccelTable() const { return accelTable; }

  /// Set the accelerator table
  void setAccelTable(FX::FXAccelTable* acceltable){ accelTable=acceltable; }

  /// Add a hot key
  void addHotKey(FX::FXHotKey code);

  /// Remove a hot key
  void remHotKey(FX::FXHotKey code);

  /// Change help tag for this widget
  void setHelpTag(const FX::FXString&  text){ tag=text; }

  /// Get the help tag for this widget
  const FX::FXString& getHelpTag() const { return tag; }

  /// Return true if window is a shell window
  bool isShell() const;

  /// Return true if specified window is owned by this window
  bool isOwnerOf(const FX::FXWindow* window) const;

  /// Return true if specified window is ancestor of this window
  bool isChildOf(const FX::FXWindow* window) const;

  /// Return true if this window contains child in its subtree
  bool containsChild(const FX::FXWindow* child) const;

  /// Return the child window at specified coordinates
  FX::FXWindow* getChildAt(FX::FXint x,FX::FXint y) const;

  /// Return the number of child windows for this window
  FX::FXint numChildren() const;

  /**
  * Return the index (starting from zero) of the specified child window,
  * or -1 if the window is not a child or NULL
  */
  FX::FXint indexOfChild(const FX::FXWindow *window) const;

  /**
  * Return the child window at specified index,
  * or NULL if the index is negative or out of range
  */
  FX::FXWindow* childAtIndex(FX::FXint index) const;

  /// Return the common ancestor of window a and window b
  static FX::FXWindow* commonAncestor(FX::FXWindow* a,FX::FXWindow* b);

  /// Return TRUE if sibling a <= sibling b in list
  static bool before(const FX::FXWindow *a,const FX::FXWindow* b);

  /// Return TRUE if sibling a >= sibling b in list
  static bool after(const FX::FXWindow *a,const FX::FXWindow* b);

  /// Return compose context
  FX::FXComposeContext* getComposeContext() const { return composeContext; }

  /// Create compose context
  void createComposeContext();

  /// Destroy compose context
  void destroyComposeContext();

  /// Set the default cursor for this window
  void setDefaultCursor(FX::FXCursor* cur);

  /// Return the default cursor for this window
  FX::FXCursor* getDefaultCursor() const { return defaultCursor; }

  /// Set the drag cursor for this window
  void setDragCursor(FX::FXCursor* cur);

  /// Return the drag cursor for this window
  FX::FXCursor* getDragCursor() const { return dragCursor; }

  /// Return the cursor position and mouse button-state
  FX::FXint getCursorPosition(FX::FXint& x,FX::FXint& y,FX::FXuint& buttons) const;

  /// Warp the cursor to the new position
  FX::FXint setCursorPosition(FX::FXint x,FX::FXint y);

  /// Return true if this window is able to receive mouse and keyboard events
  bool isEnabled() const;

  /// Return true if the window is active
  bool isActive() const;

  /// Return true if this window is a control capable of receiving the focus
  virtual bool canFocus() const;

  /// Return true if this window has the focus
  bool hasFocus() const;

  /// Return true if this window is in focus chain
  bool inFocusChain() const;

  /// Move the focus to this window
  virtual void setFocus();

  /// Remove the focus from this window
  virtual void killFocus();

  /// Notification that focus moved to new child
  virtual void changeFocus(FX::FXWindow *child);

  /**
  * This changes the default window which responds to the Return
  * key in a dialog. If enable is TRUE, this window becomes the default
  * window; when enable is FALSE, this window will be no longer the
  * default window.  Finally, when enable is MAYBE, the default window
  * will revert to the initial default window.
  */
  virtual void setDefault(FX::FXbool enable=TRUE);

  /// Return true if this is the default window
  bool isDefault() const;

  /// Make this window the initial default window
  void setInitial(bool enable=true);

  /// Return true if this is the initial default window
  bool isInitial() const;

  /// Enable the window to receive mouse and keyboard events
  virtual void enable();

  /// Disable the window from receiving mouse and keyboard events
  virtual void disable();

  /// Create all of the server-side resources for this window
  virtual void create();

  /// Attach foreign window handle to this window
  virtual void attach(FX::FXID w);

  /// Detach the server-side resources for this window
  virtual void detach();

  /// Destroy the server-side resources for this window
  virtual void destroy();

  /// Set window shape by means of region
  virtual void setShape(const FX::FXRegion& region);

  /// Set window shape by means of bitmap
  virtual void setShape(FX::FXBitmap* bitmap);

  /// Set window shape by means of icon
  virtual void setShape(FX::FXIcon* icon);

  /// Clear window shape
  virtual void clearShape();

  /// Raise this window to the top of the stacking order
  virtual void raise();

  /// Lower this window to the bottom of the stacking order
  virtual void lower();

  /**
  * Move the window immediately, in the parent's coordinate system.
  * Update the server representation as well if the window is realized.
  * Perform layout of the children when necessary.
  */
  virtual void move(FX::FXint x,FX::FXint y);

  /**
  * Resize the window to the specified width and height immediately,
  * updating the server representation as well, if the window was realized.
  * Perform layout of the children when necessary.
  */
  virtual void resize(FX::FXint w,FX::FXint h);

  /**
  * Move and resize the window immediately, in the parent's coordinate system.
  * Update the server representation as well if the window is realized.
  * Perform layout of the children when necessary.
  */
  virtual void position(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);

  /// Mark this window's layout as dirty for later layout
  virtual void recalc();

  /// Perform layout immediately
  virtual void layout();

  /// Generate a SEL_UPDATE message for the window and its children
  void forceRefresh();

  /// Reparent this window under new father before other
  virtual void reparent(FX::FXWindow* father,FX::FXWindow *other=NULL);

  /// Scroll rectangle x,y,w,h by a shift of dx,dy
  void scroll(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint dx,FX::FXint dy) const;

  /// Mark the specified rectangle to be repainted later
  void update(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h) const;

  /// Mark the entire window to be repainted later
  void update() const;

  /// Process any outstanding repaint messages immediately, for the given rectangle
  void repaint(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h) const;

  /// Process any outstanding repaint messages immediately
  void repaint() const;

  /**
  * Grab the mouse to this window; future mouse events will be
  * reported to this window even while the cursor goes outside of this window
  */
  void grab();

  /// Release the mouse grab
  void ungrab();

  /// Return true if the window has been grabbed
  bool grabbed() const;

  /// Grab keyboard device
  void grabKeyboard();

  /// Ungrab keyboard device
  void ungrabKeyboard();

  /// Return true if active grab is in effect
  bool grabbedKeyboard() const;

  /// Show this window
  virtual void show();

  /// Hide this window
  virtual void hide();

  /// Return true if the window is shown
  bool shown() const;

  /// Return true if the window is composite
  virtual bool isComposite() const;

  /// Return true if the window is under the cursor
  bool underCursor() const;

  /// Return true if this window owns the primary selection
  bool hasSelection() const;

  /// Try to acquire the primary selection, given a list of drag types
  bool acquireSelection(const FX::FXDragType *types,FX::FXuint numtypes);

  /// Release the primary selection
  bool releaseSelection();

  /// Return true if this window owns the clipboard
  bool hasClipboard() const;

  /// Try to acquire the clipboard, given a list of drag types
  bool acquireClipboard(const FX::FXDragType *types,FX::FXuint numtypes);

  /// Release the clipboard
  bool releaseClipboard();

  /// Enable this window to receive drops
  virtual void dropEnable();

  /// Disable this window from receiving drops
  virtual void dropDisable();

  /// Return true if this window is able to receive drops
  bool isDropEnabled() const;

  /// Return true if a drag operaion has been initiated from this window
  bool isDragging() const;

  /// Initiate a drag operation with a list of previously registered drag types
  bool beginDrag(const FX::FXDragType *types,FX::FXuint numtypes);

  /**
  * When dragging, inform the drop-target of the new position and
  * the drag action
  */
  bool handleDrag(FX::FXint x,FX::FXint y,FX::FXDragAction action=DRAG_COPY);

  /**
  * Terminate the drag operation with or without actually dropping the data
  * Returns the action performed by the target
  */
  FX::FXDragAction endDrag(bool drop=true);

  /// Return true if this window is the target of a drop
  bool isDropTarget() const;

  /**
  * When being dragged over, indicate that no further SEL_DND_MOTION messages
  * are required while the cursor is inside the given rectangle
  */
  void setDragRectangle(FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,bool wantupdates=true) const;

  /**
  * When being dragged over, indicate we want to receive SEL_DND_MOTION messages
  * every time the cursor moves
  */
  void clearDragRectangle() const;

  /// When being dragged over, indicate acceptance or rejection of the dragged data
  void acceptDrop(FX::FXDragAction action=DRAG_ACCEPT) const;

  /// The target accepted our drop
  FX::FXDragAction didAccept() const;

  /**
  * Sent by the drop target in response to SEL_DND_DROP.  The drag action
  * should be the same as the action the drop target reported to the drag
  * source in reponse to the SEL_DND_MOTION message.
  * This function notifies the drag source that its part of the drop transaction
  * is finished, and that it is free to release any resources involved in the
  * drag operation.
  * Calling dropFinished() is advisable in cases where the drop target needs
  * to perform complex processing on the data received from the drag source,
  * prior to returning from the SEL_DND_DROP message handler.
  */
  void dropFinished(FX::FXDragAction action=DRAG_REJECT) const;

  /// When being dragged over, inquire the drag types which are being offered
  bool inquireDNDTypes(FX::FXDNDOrigin origin,FX::FXDragType*& types,FX::FXuint& numtypes) const;

  /// When being dragged over, return true if we are offered the given drag type
  bool offeredDNDType(FX::FXDNDOrigin origin,FX::FXDragType type) const;

  /// When being dragged over, return the drag action
  FX::FXDragAction inquireDNDAction() const;

  /**
  * Set DND data; the array must be allocated with FXMALLOC and ownership is
  * transferred to the system
  */
  bool setDNDData(FX::FXDNDOrigin origin,FX::FXDragType type,FX::FXuchar* data,FX::FXuint size) const;

  /**
  * Set DND data from string value.
  */
  bool setDNDData(FX::FXDNDOrigin origin,FX::FXDragType type,const FX::FXString& string) const;

  /**
  * Get DND data; the caller becomes the owner of the array and must free it
  * with FXFREE
  */
  bool getDNDData(FX::FXDNDOrigin origin,FX::FXDragType type,FX::FXuchar*& data,FX::FXuint& size) const;

  /**
  * Get DND data into string value.
  */
  bool getDNDData(FX::FXDNDOrigin origin,FX::FXDragType type,FX::FXString& string) const;

  /// Return true if window logically contains the given point
  virtual bool contains(FX::FXint parentx,FX::FXint parenty) const;

  /// Translate coordinates from fromwindow's coordinate space to this window's coordinate space
  void translateCoordinatesFrom(FX::FXint& tox,FX::FXint& toy,const FX::FXWindow* fromwindow,FX::FXint fromx,FX::FXint fromy) const;

  /// Translate coordinates from this window's coordinate space to towindow's coordinate space
  void translateCoordinatesTo(FX::FXint& tox,FX::FXint& toy,const FX::FXWindow* towindow,FX::FXint fromx,FX::FXint fromy) const;

  /// Set window background color
  virtual void setBackColor(FX::FXColor clr);

  /// Get background color
  FX::FXColor getBackColor() const { return backColor; }

  virtual bool doesSaveUnder() const;

  /**
  * Translate message for localization; using the current FXTranslator,
  * an attempt is made to translate the given message into the current
  * language.  An optional hint may be passed to break any ties in case
  * more than one tranlation is possible for the given message text.
  * In addition, the name of the widget is passed as context name so
  * that controls in a single dialog may be grouped together.
  */
  virtual const FX::FXchar* tr(const FX::FXchar* message,const FX::FXchar* hint=NULL) const;

  /// Save window to stream
  virtual void save(FX::FXStream& store) const;

  /// Restore window from stream
  virtual void load(FX::FXStream& store);

  /// Destroy window
  virtual ~FXWindow();
  };

}

#endif
