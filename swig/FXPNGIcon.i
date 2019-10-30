/* FXPNGIcon.i */

%pythonappend FX::FXPNGIcon::FXPNGIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyPNGIcon::FXPyPNGIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
#ifndef FXICON_H
#include "FXIcon.h"
#endif

namespace FX {


/// Portable Network Graphics (PNG) Icon class
class FXPNGIcon : public FXIcon {
public:
  static const FXchar fileExt[];
  static const FXchar mimeType[];
public:

  /// Construct an icon from memory stream formatted in PNG format
  FXPNGIcon(FXApp *a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);

  /// True if format is supported
  static const bool supported;

  /// Save pixels into stream in PNG format
  virtual bool savePixels(FXStream& store) const;

  /// Load pixels from stream in PNG format
  virtual bool loadPixels(FXStream& store);

  /// Destroy
  virtual ~FXPNGIcon();
  };


/**
* Check if stream contains a PNG, return TRUE if so.
*/
extern bool fxcheckPNG(FXStream& store);


/**
* Load an PNG (Portable Network Graphics) file from a stream.
* Upon successful return, the pixel array and size are returned.
* If an error occurred, the pixel array is set to NULL.
*/
extern bool fxloadPNG(FXStream& store,FXColor*& data,FXint& width,FXint& height);


/**
* Save an PNG (Portable Network Graphics) file to a stream.
*/
extern bool fxsavePNG(FXStream& store,const FXColor* data,FXint width,FXint height);

class FXPyPNGIcon : public FXPNGIcon {
public:
    FXPyPNGIcon(FXApp *a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};
}
