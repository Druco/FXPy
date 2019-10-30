/* FXSettings.i */

%pythonappend FX::FXSettings::FXSettings %{
  self.thisown = False
%}
%pythonappend FX::FXPySettings::FXPySettings %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"
%include "include/FXSettings.h"


namespace FX {
class FXPySettings : public FXSettings {
public:
    FXPySettings();
};
}
