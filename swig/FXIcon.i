/* FXIcon.i */

%pythonappend FX::FXIcon::FXIcon %{
  self.thisown = False
%}
%pythonappend FX::FXPyIcon::FXPyIcon %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXIMAGE_H
#include "FXImage.h"
#endif

namespace FX {

class FXDC;
class FXDCWindow;
class FXDrawable;
class FXTopWindow;


/**
* An Icon is an image with two additional server-side resources: a shape
* bitmap, which is used to mask those pixels where the background should
* be preserved during the drawing, and a etch bitmap, which is used to
* draw the icon when it is disabled.
*/
class FXIcon : public FXImage {
public:

  /**
  * Create an icon with an initial pixel buffer pix, a transparent color clr,
  * and options as in FXImage.  The transparent color is used to determine which
  * pixel values are transparent, i.e. need to be masked out in the absence of
  * a true alpha channel.
  * If the flag IMAGE_OPAQUE is passed, the shape and etch bitmaps are generated
  * as if the image is fully opaque, even if it has an alpha channel or transparancy
  * color.  The flag IMAGE_ALPHACOLOR is used to force a specific alpha color instead
  * of the alpha channel obtained from the image file.
  * Specifying IMAGE_ALPHAGUESS causes Icon to obtain the alpha color from the background
  * color of the image; it has the same effect as IMAGE_ALPHACOLOR in the sense that
  * the icon will be transparent for those colors matching the alpha color.
  */
  FXIcon(FXApp* a,const FXColor *pix=NULL,FXColor clr=0,FXuint opts=0,FXint w=1,FXint h=1);

  /**
  * Create the server side pixmap, the shape bitmap, and the etch bitmap, then
  * call render() to fill it with the pixel data from the client-side buffer.  After
  * the server-side pixmap and bitmaps have been created, the client-side pixel
  * buffer will be deleted unless IMAGE_KEEP has been specified. If the pixel buffer
  * is not owned, i.e. the flag IMAGE_OWNED is not set, the pixel buffer will not
  * be deleted; however the pixel buffer will be set to NULL.
  */
  virtual void create();

  /**
  * Detach the server side pixmap, shape bitmap, and etch bitmap from the Icon.
  * Afterwards, the Icon is left as if it never had a server-side resources.
  */
  virtual void detach();

  /**
  * Destroy the server-side pixmap and the shape bitmap and etch bitmap.
  * The client-side pixel buffer is not affected.
  */
  virtual void destroy();

  /**
  * Render the server-side pixmap, shape bitmap and etch bitmap for the icon
  * from the client-side pixel buffer.
  */
  virtual void render();

  /**
  * Resize both client-side and server-side representations (if any) to the
  * given width and height.  The new representations typically contain garbage
  * after this operation and need to be re-filled.
  */
  virtual void resize(FXint w,FXint h);

  /// Obtain transparency color
  FXColor getTransparentColor() const { return transp; }

  /// Change transparency color
  void setTransparentColor(FXColor color){ transp=color; }

  /// Destructor
  virtual ~FXIcon();
  };

class FXPyIcon : public FXIcon {
public:
    FXPyIcon(FXApp* a,const FXColor *pix=NULL,FXColor clr=0,FXuint opts=0,FXint w=1,FXint h=1);
};
}
