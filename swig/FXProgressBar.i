/* FXProgressBar.i */

%pythonappend FX::FXProgressBar::FXProgressBar %{
  self.thisown = False
%}
%pythonappend FX::FXPyProgressBar::FXPyProgressBar %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXFRAME_H
#include "FXFrame.h"
#endif

namespace FX {


/// Progress bar styles
enum {
  PROGRESSBAR_HORIZONTAL = 0,             /// Horizontal display
  PROGRESSBAR_VERTICAL   = 0x00008000,    /// Vertical display
  PROGRESSBAR_PERCENTAGE = 0x00010000,    /// Show percentage done
  PROGRESSBAR_DIAL       = 0x00020000,    /// Show as a dial instead of bar
  PROGRESSBAR_NORMAL     = FRAME_SUNKEN|FRAME_THICK
  };


/// Progress bar widget
class FXProgressBar : public FXFrame {
public:
  long onPaint(FXObject*,FXSelector,void*);
  long onCmdSetValue(FXObject*,FXSelector,void*);
  long onCmdSetIntValue(FXObject*,FXSelector,void*);
  long onCmdGetIntValue(FXObject*,FXSelector,void*);
public:

  /// Construct progress bar
  FXProgressBar(FXComposite* p,FXObject* target=NULL,FXSelector sel=0,FXuint opts=PROGRESSBAR_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);

  /// Create server-side resources
  virtual void create();

  /// Detach server-side resources
  virtual void detach();

  /// Return default width
  virtual FXint getDefaultWidth();

  /// Return default height
  virtual FXint getDefaultHeight();

  /// Change the amount of progress
  void setProgress(FXuint value);

  /// Get current progress
  FXuint getProgress() const { return progress; }

  /// Set total amount of progress
  void setTotal(FXuint value);

  /// Return total amount of progrss
  FXuint getTotal() const { return total; }

  /// Increment progress by given amount
  void increment(FXuint value);

  /// Hide progress percentage
  void hideNumber();

  /// Show progress percentage
  void showNumber();

  /// Change progress bar width
  void setBarSize(FXint size);

  /// Return progress bar width
  FXint getBarSize() const { return barsize; }

  /// Change backgroundcolor
  void setBarBGColor(FXColor clr);

  /// Return background color
  FXColor getBarBGColor() const { return barBGColor; }

  /// Change bar color
  void setBarColor(FXColor clr);

  /// Return bar color
  FXColor getBarColor() const { return barColor; }

  /// Change text color
  void setTextColor(FXColor clr);

  /// Return text color
  FXColor getTextColor() const { return textNumColor; }

  /// Change alternate text color shown when bar under text
  void setTextAltColor(FXColor clr);

  /// Return alternate text color
  FXColor getTextAltColor() const { return textAltColor; }

  /// Set the text font
  void setFont(FXFont *fnt);

  /// Get the text font
  FXFont* getFont() const { return font; }

  /// Change progress bar style
  void setBarStyle(FXuint style);

  /// Return current progress bar style
  FXuint getBarStyle() const;

  /// Save progress bar to a stream
  virtual void save(FXStream& store) const;

  /// Load progress bar from a stream
  virtual void load(FXStream& store);

  /// Destructor
  virtual ~FXProgressBar();
  };

class FXPyProgressBar : public FXProgressBar {
public:
    FXPyProgressBar(FXComposite* p,FXObject* target=NULL,FXSelector sel=0,FXuint opts=PROGRESSBAR_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};
}
