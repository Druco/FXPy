/* FXBitmapFrame.i */

%pythonappend FX::FXBitmapFrame::FXBitmapFrame %{
  self.thisown = False
%}
%pythonappend FX::FXPyBitmapFrame::FXPyBitmapFrame %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXBitmapFrame.h"

namespace FX {
class FXPyBitmapFrame : public FXBitmapFrame {
public:
  FXPyBitmapFrame(FXComposite* p,FXBitmap *bmp,FXuint opts=FRAME_SUNKEN|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};

}
