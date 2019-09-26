/********************************************************************************
*                                                                               *
*                    A S C I I   C h a r a c t e r   I n f o                    *
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
* $Id: fxascii.h,v 1.3 2006/01/22 17:58:13 fox Exp $                            *
********************************************************************************/
#ifndef FXASCII_H
#define FXASCII_H


namespace FX {

namespace Ascii {

/// Get numeric value of character (this includes hex value)
extern FXint digitValue(FXchar asc);

/// Ascii-only common functions
extern bool hasCase(FXchar asc);
extern bool isUpper(FXchar asc);
extern bool isLower(FXchar asc);
extern bool isTitle(FXchar asc);
extern bool isAscii(FXchar asc);
extern bool isLetter(FXchar asc);
extern bool isDigit(FXchar asc);
extern bool isAlphaNumeric(FXchar asc);
extern bool isControl(FXchar asc);
extern bool isSpace(FXchar asc);
extern bool isBlank(FXchar asc);
extern bool isPunct(FXchar asc);
extern bool isGraph(FXchar asc);
extern bool isPrint(FXchar asc);
extern bool isHexDigit(FXchar asc);
extern bool isSymbol(FXchar asc);
extern bool isSep(FXchar asc);

/// Case conversion
extern FXchar toUpper(FXchar asc);
extern FXchar toLower(FXchar asc);
extern FXchar toTitle(FXchar asc);

}

}

#endif
