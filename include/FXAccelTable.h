/********************************************************************************
*                                                                               *
*                   A c c e l e r a t o r   T a b l e   C l a s s               *
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
* $Id: FXAccelTable.h,v 1.27 2006/01/22 17:57:58 fox Exp $                      *
********************************************************************************/
#ifndef FXACCELTABLE_H
#define FXACCELTABLE_H

#ifndef FXOBJECT_H
#include "FXObject.h"
#endif

namespace FX {


/**
* The accelerator table sends a message to a specific
* target object when the indicated key and modifier combination
* is pressed.
*/
class FXAccelTable : public FX::FXObject {
  FXDECLARE(FX::FXAccelTable)
protected:
  struct FXAccelKey {
    FX::FXObject    *target;    // Target object of message
    FX::FXSelector   messagedn; // Message being sent
    FX::FXSelector   messageup; // Message being sent
    FX::FXHotKey     code;      // Keysym and modifier mask to match
    };
private:
  void resize(FX::FXuint m);
private:
  FXAccelTable(const FX::FXAccelTable&);
  FXAccelTable &operator=(const FX::FXAccelTable&);
public:
  long onKeyPress(FX::FXObject*,FX::FXSelector,void*);
  long onKeyRelease(FX::FXObject*,FX::FXSelector,void*);
public:

  /// Construct empty accelerator table
  FXAccelTable();

  /// Add an accelerator into the table
  void addAccel(FX::FXHotKey hotkey,FX::FXObject* target=NULL,FX::FXSelector seldn=0,FX::FXSelector selup=0);

  /// Remove an accelerator from the table
  void removeAccel(FX::FXHotKey hotkey);

  /// Return true if accelerator specified
  bool hasAccel(FX::FXHotKey hotkey) const;

  /// Return target object of the given accelerator
  FX::FXObject* targetOfAccel(FX::FXHotKey hotkey) const;

  /**
  * Parse accelerator from string, yielding modifier and
  * key code.  For example, parseAccel("Ctl+Shift+X")
  * yields MKUINT(KEY_X,CONTROLMASK|SHIFTMASK).
  */
  friend FX::FXHotKey parseAccel(const FX::FXString& string);

  /**
  * Unparse hot key comprising modifier and key code back
  * into a string suitable for parsing with fxparseHotKey.
  */
  friend FX::FXString unparseAccel(FX::FXHotKey key);

  /**
  * Parse hot key from string, yielding modifier and
  * key code.  For example, parseHotKey(""Salt && &Pepper!"")
  * yields MKUINT(KEY_p,ALTMASK).
  */
  friend FX::FXHotKey parseHotKey(const FX::FXString& string);

  /**
  * Obtain hot key offset in string, or -1 if not found.
  * For example, findHotKey("Salt && &Pepper!") yields 7.
  * Note that this is the byte-offset, not the character
  * index!
  */
  friend FX::FXint findHotKey(const FX::FXString& string);

  /**
  * Strip hot key combination from the string.
  * For example, stripHotKey("Salt && &Pepper") should
  * yield "Salt & Pepper".
  */
  friend FX::FXString stripHotKey(const FX::FXString& string);

  /// Save table to a stream
  virtual void save(FX::FXStream& store) const;

  /// Load table from a stream
  virtual void load(FX::FXStream& store);

  /// Destructor
  virtual ~FXAccelTable();
  };


extern FX::FXHotKey parseAccel(const FX::FXString& string);
extern FX::FXString unparseAccel(FX::FXHotKey key);
extern FX::FXHotKey parseHotKey(const FX::FXString& string);
extern FX::FXint findHotKey(const FX::FXString& string);
extern FX::FXString stripHotKey(const FX::FXString& string);

}

#endif
