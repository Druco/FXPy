/* FXImageView.i */

%pythonappend FX::FXImageView::FXImageView %{
  self.thisown = False
%}

#ifndef FXSCROLLAREA_H
#include "FXScrollArea.h"
#endif

namespace FX {


class FXImage;


/// Image alignment styles
enum {
  IMAGEVIEW_NORMAL    = 0,              /// Normal mode is centered
  IMAGEVIEW_CENTER_X  = 0,              /// Centered horizontally
  IMAGEVIEW_LEFT      = 0x00100000,     /// Left-aligned
  IMAGEVIEW_RIGHT     = 0x00200000,     /// Right-aligned
  IMAGEVIEW_CENTER_Y  = 0,              /// Centered vertically
  IMAGEVIEW_TOP       = 0x00400000,     /// Top-aligned
  IMAGEVIEW_BOTTOM    = 0x00800000      /// Bottom-aligned
  };


/**
* The Image View widget display a scrollable view of an image.
*/
class FXImageView : public FXScrollArea {
public:
  long onPaint(FXObject*,FXSelector,void*);
  long onMotion(FXObject*,FXSelector,void*);
  long onRightBtnPress(FXObject*,FXSelector,void*);
  long onRightBtnRelease(FXObject*,FXSelector,void*);
public:
  enum {
    ID_XYZ=FXScrollArea::ID_LAST,
    ID_LAST
    };
public:

  /// Construct a scroll window
  FXImageView(FXComposite* p,FXImage* img=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

  /// Create server-side resources
  virtual void create();

  /// Detach server-side resources
  virtual void detach();

  /// Perform layout
  virtual void layout();

  /// Image view widget can receive focus
  virtual bool canFocus() const;

  /// Return the width of the contents
  virtual FXint getContentWidth();

  /// Return the height of the contents
  virtual FXint getContentHeight();

  /// Change image
  void setImage(FXImage* img);

  /// Return image
  FXImage* getImage() const { return image; }

  /// Set the current alignment.
  void setAlignment(FXuint mode);

  /// Get the current alignment.
  FXuint getAlignment() const;

  /// Save list to a stream
  virtual void save(FXStream& store) const;

  /// Load list from a stream
  virtual void load(FXStream& store);

  /// Destroy
  virtual ~FXImageView();
  };

}
