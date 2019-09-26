/********************************************************************************
*                                                                               *
*                       C o m p o s i t e   W i d g e t                         *
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
* $Id: FXComposite.h,v 1.24 2006/01/22 17:57:59 fox Exp $                       *
********************************************************************************/
#ifndef FXCOMPOSITE_H
#define FXCOMPOSITE_H

#ifndef FXWINDOW_H
#include "FXWindow.h"
#endif

namespace FX {


/// Base composite
class FXComposite : public FXWindow {
  FXDECLARE(FX::FXComposite)
protected:
  FXComposite(){}
  FXComposite(FX::FXApp* a,FX::FXVisual *vis);
  FXComposite(FX::FXApp* a,FX::FXWindow* own,FX::FXuint opts,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
private:
  FXComposite(const FX::FXComposite&);
  FXComposite &operator=(const FX::FXComposite&);
public:
  long onKeyPress(FX::FXObject*,FX::FXSelector,void*);
  long onKeyRelease(FX::FXObject*,FX::FXSelector,void*);
  long onFocusNext(FX::FXObject*,FX::FXSelector,void*);
  long onFocusPrev(FX::FXObject*,FX::FXSelector,void*);
  long onCmdUpdate(FX::FXObject*,FX::FXSelector,void*);
public:

  /// Constructor
  FXComposite(FX::FXComposite* p,FX::FXuint opts=0,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);

  /// Create server-side resources
  virtual void create();

  /// Detach server-side resources
  virtual void detach();

  /// Destroy server-side resources
  virtual void destroy();

  /// Perform layout
  virtual void layout();

  /// Return default width
  virtual FX::FXint getDefaultWidth();

  /// Return default height
  virtual FX::FXint getDefaultHeight();

  /// Return the width of the widest child window
  FX::FXint maxChildWidth() const;

  /// Return the height of the tallest child window
  FX::FXint maxChildHeight() const;

  /// Overrides this virtual function to return TRUE
  virtual bool isComposite() const;

  /// Destructor
  virtual ~FXComposite();
  };

}

#endif
