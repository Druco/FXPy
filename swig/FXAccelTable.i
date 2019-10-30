/* FXAccelTable.i */


%pythonappend FX::FXAccelTable::FXAccelTable %{
  self.thisown = False
%}
%pythonappend FX::FXPyAccelTable::FXPyAccelTable %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXAccelTable.h"

namespace FX {
class FXPyAccelTable : public FXAccelTable {
  FXPyAccelTable();
  };

}
