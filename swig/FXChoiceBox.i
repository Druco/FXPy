/* FXChoiceBox.i */

%pythonappend FX::FXChoiceBox::FXChoiceBox %{
  self.thisown = False
%}
%pythonappend FX::FXPyChoiceBox::FXPyChoiceBox %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXChoiceBox.h"

namespace FX {
    class FXPyChoiceBox : public FXChoiceBox {
    public:
        FXPyChoiceBox(FXWindow* owner,const FXString& caption,const FXString& text,FXIcon* icon,const FXchar** choices,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

        FXPyChoiceBox(FXWindow* owner,const FXString& caption,const FXString& text,FXIcon* icon,const FXString& choices,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

        FXPyChoiceBox(FXApp* app,const FXString& caption,const FXString& text,FXIcon* icon,const FXchar** choices,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

        FXPyChoiceBox(FXApp* app,const FXString& caption,const FXString& text,FXIcon* icon,const FXString& choices,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

}
