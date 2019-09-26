/********************************************************************************
*                                                                               *
*                        B M P   I c o n   O b j e c t                          *
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
* $Id: FXBMPIcon.h,v 1.22 2006/01/22 17:57:59 fox Exp $                         *
********************************************************************************/
#ifndef FXBMPICON_H
#define FXBMPICON_H

#ifndef FXICON_H
#include "FXIcon.h"
#endif

namespace FX {


/**
* The BMP Icon class is a convenience class for working with icons in the
* Microsoft Bitmap (.bmp) graphics file format.  This makes it possible to
* use resources created with Windows development tools inside FOX without
* need for graphics file format translators.  The bitmap loaded handles
* 1, 4, and 8 bit paletted bitmaps, 16 and 24 bit RGB bitmaps, and
* 32 bit RGBA bitmaps.
*/
class FXBMPIcon : public FX::FXIcon {
  FXDECLARE(FX::FXBMPIcon)
protected:
  FXBMPIcon(){}
private:
  FXBMPIcon(const FX::FXBMPIcon&);
  FXBMPIcon &operator=(const FX::FXBMPIcon&);
public:
  static const FX::FXchar fileExt[];
  static const FX::FXchar mimeType[];
public:

  /// Construct icon from memory stream formatted in Microsoft BMP format
  FXBMPIcon(FX::FXApp* a,const void *pix=NULL,FX::FXColor clr=FXRGB(192,192,192),FX::FXuint opts=0,FX::FXint w=1,FX::FXint h=1);

  /// Save pixels into stream in Microsoft bitmap format
  virtual bool savePixels(FX::FXStream& store) const;

  /// Load pixels from stream in Microsoft bitmap format
  virtual bool loadPixels(FX::FXStream& store);

  /// Destroy icon
  virtual ~FXBMPIcon();
  };


/**
* Check if stream contains a bitmap, return TRUE if so.
*/
extern bool fxcheckBMP(FX::FXStream& store);


/**
* Load an BMP (Microsoft Bitmap) file from a stream.
* Upon successful return, the pixel array and size are returned.
* If an error occurred, the pixel array is set to NULL.
*/
extern bool fxloadBMP(FX::FXStream& store,FX::FXColor*& data,FX::FXint& width,FX::FXint& height);


/**
* Save an BMP (Microsoft Bitmap) file to a stream.
*/
extern bool fxsaveBMP(FX::FXStream& store,const FX::FXColor *data,FX::FXint width,FX::FXint height);

}

#endif
