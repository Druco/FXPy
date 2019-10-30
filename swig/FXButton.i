/* FXButton.i */

%pythonappend FX::FXButton::FXButton %{
  self.thisown = False
%}
%pythonappend FX::FXPyButton::FXPyButton %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXLABEL_H
#include "FXLabel.h"
#endif

namespace FX {


/// Button state bits
enum {
  STATE_UP        = 0,		  /// Button is up
  STATE_DOWN      = 1,		  /// Button is down
  STATE_ENGAGED   = 2,		  /// Button is engaged
  STATE_UNCHECKED = STATE_UP,	  /// Same as STATE_UP (used for check buttons or radio buttons)
  STATE_CHECKED   = STATE_ENGAGED /// Same as STATE_ENGAGED (used for check buttons or radio buttons)
  };


/// Button flags
enum {
  BUTTON_AUTOGRAY  = 0x00800000,  /// Automatically gray out when not updated
  BUTTON_AUTOHIDE  = 0x01000000,  /// Automatically hide button when not updated
  BUTTON_TOOLBAR   = 0x02000000,  /// Toolbar style button [flat look]
  BUTTON_DEFAULT   = 0x04000000,  /// May become default button when receiving focus
  BUTTON_INITIAL   = 0x08000000,  /// This button is the initial default button
  BUTTON_NORMAL    = (FRAME_RAISED|FRAME_THICK|JUSTIFY_NORMAL|ICON_BEFORE_TEXT)
  };


class FXButton : public FXLabel {
public:
  long onPaint(FXObject*,FXSelector,void*);
  long onUpdate(FXObject*,FXSelector,void*);
  long onEnter(FXObject*,FXSelector,void*);
  long onLeave(FXObject*,FXSelector,void*);
  long onFocusIn(FXObject*,FXSelector,void*);
  long onFocusOut(FXObject*,FXSelector,void*);
  long onUngrabbed(FXObject*,FXSelector,void*);
  long onLeftBtnPress(FXObject*,FXSelector,void*);
  long onLeftBtnRelease(FXObject*,FXSelector,void*);
  long onKeyPress(FXObject*,FXSelector,void*);
  long onKeyRelease(FXObject*,FXSelector,void*);
  long onHotKeyPress(FXObject*,FXSelector,void*);
  long onHotKeyRelease(FXObject*,FXSelector,void*);
  long onCheck(FXObject*,FXSelector,void*);
  long onUncheck(FXObject*,FXSelector,void*);
  long onCmdSetValue(FXObject*,FXSelector,void*);
  long onCmdSetIntValue(FXObject*,FXSelector,void*);
  long onCmdGetIntValue(FXObject*,FXSelector,void*);
public:
  FXButton(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=BUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
  void setState(FXuint s);
  FXuint getState() const { return state; }
  void setButtonStyle(FXuint style);
  FXuint getButtonStyle() const;
  };

class FXPyButton : public FXButton {
public:
  FXPyButton(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=BUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
  };

}
