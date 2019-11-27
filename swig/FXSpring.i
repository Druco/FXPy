/* FXSpring.i */

%pythonappend FX::FXSpring::FXSpring %{
  self.thisown = False
%}
%pythonappend FX::FXPySpring::FXPySpring %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXSpring.h"

namespace FX {
class FXPySpring : public FXSpring {
    FXDECLARE(FXPySpring)
public:
    FXPySpring(FXComposite *p,FXuint opts=0,FXint relw=0,FXint relh=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};
}
