/* FXPacker.i */

%pythonappend FX::FXPacker::FXPacker %{
  self.thisown = False
%}
%pythonappend FX::FXPyPacker::FXPyPacker %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXPacker.h"

namespace FX {
class FXPyPacker : public FXPacker {
    FXDECLARE(FXPyPacker)
public:
    FXPyPacker(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};
}
