/* FXShutter.i */

%pythonappend FX::FXShutter::FXShutter %{
  self.thisown = False
%}
%pythonappend FX::FXPyShutter::FXPyShutter %{
  self.thisown = False
  FXPyRegister(self)
%}
%pythonappend FX::FXShutterItem::FXShutterItem %{
  self.thisown = False
%}
%pythonappend FX::FXPyShutterItem::FXPyShutterItem %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXShutter.h"


namespace FX {
class FXPyShutterItem : public FXShutterItem {
    FXDECLARE(FXPyShutterItem)
public:
    FXPyShutterItem(FXShutter *p,const FXString& text=FXString::null,FXIcon* icon=NULL,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};
}


namespace FX {
class FXPyShutter : public FXShutter {
    FXDECLARE(FXPyShutter)
public:
    FXPyShutter(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};
}
