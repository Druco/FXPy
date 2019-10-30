/* FXUndoList.i */

%pythonappend FX::FXCommandGroup::FXCommandGroup %{
  self.thisown = False
%}
%pythonappend FX::FXPyCommandGroup::FXPyCommandGroup %{
  self.thisown = False
  FXPyRegister(self)
%}

%pythonappend FX::FXUndoList::FXUndoList %{
  self.thisown = False
%}
%pythonappend FX::FXPyUndoList::FXPyUndoList %{
  self.thisown = False
%}

%include "include/fxdefs2.h"
%include "include/FXUndoList.h"

namespace FX {
class FXPyCommandGroup : public FXCommandGroup {
public:
    FXPyCommandGroup();

};
}


namespace FX {
class FXPyUndoList : public FXUndoList {
public:
    FXPyUndoList();
    %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
};
}
