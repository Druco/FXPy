/* FX7Segment.i */

%pythonappend FX::FX7Segment::FX7Segment %{
  self.thisown = False
%}
%pythonappend FX::FXPy7Segment::FXPy7Segment %{
  self.thisown = False
  FXPyRegister(self)
%}

%module FX7Segment


#ifndef FXFRAME_H
#include "FXFrame.h"
#endif


namespace FX {

/// 7 Segment styles
enum {
  SEVENSEGMENT_NORMAL   = 0,            /// Draw segments normally
  SEVENSEGMENT_SHADOW   = 0x00080000    /// Draw shadow under the segments
  };

class FX7Segment : public FXFrame {
public:
  long onPaint(FXObject*,FXSelector,void*);
  long onCmdSetValue(FXObject*,FXSelector,void*);
  long onCmdSetIntValue(FXObject*,FXSelector,void*);
  long onCmdSetRealValue(FXObject*,FXSelector,void*);
  long onCmdSetStringValue(FXObject*,FXSelector,void*);
  long onCmdGetIntValue(FXObject*,FXSelector,void*);
  long onCmdGetRealValue(FXObject*,FXSelector,void*);
  long onCmdGetStringValue(FXObject*,FXSelector,void*);
  long onCmdSetHelp(FXObject*,FXSelector,void*);
  long onCmdGetHelp(FXObject*,FXSelector,void*);
  long onCmdSetTip(FXObject*,FXSelector,void*);
  long onCmdGetTip(FXObject*,FXSelector,void*);
  long onQueryHelp(FXObject*,FXSelector,void*);
  long onQueryTip(FXObject*,FXSelector,void*);
public:

  FX7Segment(FXComposite* p,const FXString& text,FXuint opts=SEVENSEGMENT_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);

  void setText(const FXString& text);
  FXString getText() const;
  void setTextColor(FXColor clr);
  FXColor getTextColor() const;
  void setCellWidth(FXint w);
  FXint getCellWidth() const;
  void setCellHeight(FXint h);
  FXint getCellHeight() const;
  void setThickness(FXint t);
  FXint getThickness() const;
  void set7SegmentStyle(FXuint style);
  FXuint get7SegmentStyle() const;
  void setJustify(FXuint mode);
  FXuint getJustify() const;
  void setHelpText(const FXString& text);
  const FXString& getHelpText() const;
  void setTipText(const FXString& text);
  const FXString& getTipText() const;
  };

class FXPy7Segment : public FX7Segment {
    FXDECLARE(FXPy7Segment)
public:
  FXPy7Segment(FXComposite* p,const FXString& text,FXuint opts=SEVENSEGMENT_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
  };
}
