/********************************************************************************
*                                                                               *
*                         C o l o r   L i s t   W i d g e t                     *
*                                                                               *
*********************************************************************************
* Copyright (C) 2005,2006 by Jeroen van der Zijp.   All Rights Reserved.        *
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
* $Id: FXColorList.h,v 1.4.2.1 2006/07/27 02:18:50 fox Exp $                        *
********************************************************************************/
#ifndef FXCOLORLIST_H
#define FXCOLORLIST_H

#ifndef FXLIST_H
#include "FXList.h"
#endif

namespace FX {


/// Color item
class FXColorItem : public FX::FXListItem {
  FXDECLARE(FX::FXColorItem)
protected:
  FX::FXColor  color;
private:
  FXColorItem(const FX::FXColorItem&);
  FXColorItem& operator=(const FX::FXColorItem&);
protected:
  FXColorItem():color(0){}
  virtual void draw(const FX::FXList* list,FX::FXDC& dc,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h);
  virtual FX::FXint hitItem(const FX::FXList* list,FX::FXint x,FX::FXint y) const;
public:
  /// Construct new item with given text, color, and user-data
  FXColorItem(const FX::FXString& text,FX::FXColor clr,void* ptr=NULL):FX::FXListItem(text,NULL,ptr),color(clr){}

  /// Change item's color
  void setColor(FX::FXColor clr){ color=clr; }

  /// Return item's color
  FX::FXColor getColor() const { return color; }

  /// Return width of item as drawn in list
  virtual FX::FXint getWidth(const FX::FXList* list) const;

  /// Return height of item as drawn in list
  virtual FX::FXint getHeight(const FX::FXList* list) const;
  };


/**
* A ColorList Widget displays a list of colors.
*/
class FXColorList : public FX::FXList {
  FXDECLARE(FX::FXColorList)
protected:
  FXColorList(){}
  virtual FX::FXListItem *createItem(const FX::FXString& text,FX::FXIcon* icon,void* ptr);
private:
  FXColorList(const FX::FXColorList&);
  FXColorList &operator=(const FX::FXColorList&);
public:

  /// Construct a list with initially no items in it
  FXColorList(FX::FXComposite *p,FX::FXObject* tgt=NULL,FX::FXSelector sel=0,FX::FXuint opts=LIST_BROWSESELECT,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);

  /// Fill list by appending color items from array of strings and array of colors
  FX::FXint fillItems(const FX::FXchar** strings,FX::FXColor *colors=NULL,void* ptr=NULL,FX::FXbool notify=FALSE);

  /// Insert item at index with given text, color, and user-data pointer
  FX::FXint insertItem(FX::FXint index,const FX::FXString& text,FX::FXColor color=0,void* ptr=NULL,FX::FXbool notify=FALSE);

  /// Append new item with given text, color, and user-data pointer
  FX::FXint appendItem(const FX::FXString& text,FX::FXColor color=0,void* ptr=NULL,FX::FXbool notify=FALSE);

  /// Prepend new item with given text, color, and user-data pointer
  FX::FXint prependItem(const FX::FXString& text,FX::FXColor color=0,void* ptr=NULL,FX::FXbool notify=FALSE);

  /// Change item color
  void setItemColor(FX::FXint index,FX::FXColor color);

  /// Return item color
  FX::FXColor getItemColor(FX::FXint index) const;
  };

}

#endif
