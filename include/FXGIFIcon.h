/********************************************************************************
*                                                                               *
*                        G I F   I c o n   O b j e c t                          *
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
* $Id: FXGIFIcon.h,v 1.24 2006/01/22 17:58:02 fox Exp $                         *
********************************************************************************/
#ifndef FXGIFICON_H
#define FXGIFICON_H

#ifndef FXICON_H
#include "FXIcon.h"
#endif

namespace FX {

/// GIF Icon class
class FXGIFIcon : public FX::FXIcon {
  FXDECLARE(FX::FXGIFIcon)
protected:
  FXGIFIcon(){}
private:
  FXGIFIcon(const FX::FXGIFIcon&);
  FXGIFIcon &operator=(const FX::FXGIFIcon&);
public:
  static const FX::FXchar fileExt[];
  static const FX::FXchar mimeType[];
public:

  /// Construct an icon from memory stream formatted as GIF format
  FXGIFIcon(FX::FXApp* a,const void *pix=NULL,FX::FXColor clr=FXRGB(192,192,192),FX::FXuint opts=0,FX::FXint w=1,FX::FXint h=1);

  /// Save pixels into stream in GIF format
  virtual bool savePixels(FX::FXStream& store) const;

  /// Load pixels from stream in GIF format
  virtual bool loadPixels(FX::FXStream& store);

  /// Destroy
  virtual ~FXGIFIcon();
  };



#ifndef FXLOADGIF
#define FXLOADGIF

/**
* Check if stream contains a GIF, return TRUE if so.
*/
extern bool fxcheckGIF(FX::FXStream& store);


/**
* Load an GIF (Graphics Interchange Format) file from a stream.
* Upon successful return, the pixel array and size are returned.
* If an error occurred, the pixel array is set to NULL.
*/
extern bool fxloadGIF(FX::FXStream& store,FX::FXColor*& data,FX::FXint& width,FX::FXint& height);


/**
* Save an GIF (Graphics Interchange Format) file to a stream.  The flag
* "fast" is used to select the faster Floyd-Steinberg dither method instead
* of the slower Wu quantization algorithm.
*/
extern bool fxsaveGIF(FX::FXStream& store,const FX::FXColor *data,FX::FXint width,FX::FXint height,bool fast=true);

#endif

}

#endif
