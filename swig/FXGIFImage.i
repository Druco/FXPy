/* FXGIFImage.i */

%pythonappend FX::FXGIFImage::FXGIFImage %{
  self.thisown = False
%}
%pythonappend FX::FXPyGIFImage::FXPyGIFImage %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXIMAGE_H
#include "FXImage.h"
#endif

namespace FX {

/// GIF Image class
class FXGIFImage : public FXImage {
public:
  static const FXchar fileExt[];
  static const FXchar mimeType[];
public:

  /// Construct an image from memory stream formatted as CompuServe GIF format
  FXGIFImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);

  /// Save pixels into stream in [un]GIF format
  virtual bool savePixels(FXStream& store) const;

  /// Load pixels from stream in CompuServe GIF format
  virtual bool loadPixels(FXStream& store);

  /// Destroy
  virtual ~FXGIFImage();
  };


#ifndef FXLOADGIF
#define FXLOADGIF

/**
* Check if stream contains a GIF, return TRUE if so.
*/
extern bool fxcheckGIF(FXStream& store);


/**
* Load an GIF (Graphics Interchange Format) file from a stream.
* Upon successful return, the pixel array and size are returned.
* If an error occurred, the pixel array is set to NULL.
*/
extern bool fxloadGIF(FXStream& store,FXColor*& data,FXint& width,FXint& height);


/**
* Save an GIF (Graphics Interchange Format) file to a stream.
*/
extern bool fxsaveGIF(FXStream& store,const FXColor *data,FXint width,FXint height,bool fast=true);

#endif

class FXPyGIFImage : public FXGIFImage {
    FXDECLARE(FXPyGIFImage)
public:
    FXPyGIFImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

}
