/* FXFontDialog.i */

%pythonappend FX::FXFontDialog::FXFontDialog %{
  self.thisown = False
%}
%pythonappend FX::FXPyFontDialog::FXPyFontDialog %{
  self.thisown = False
  FXPyRegister(self)
%}

%include "include/fxdefs2.h"

namespace FX {


class FXFontSelector;


/// Font selection dialog
class FXAPI FXFontDialog : public FXDialogBox {
  FXDECLARE(FXFontDialog)
protected:
  FXFontSelector *fontbox;
protected:
  FXFontDialog(){}
private:
  FXFontDialog(const FXFontDialog&);
  FXFontDialog &operator=(const FXFontDialog&);
public:
  /// Constructor
  FXFontDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=600,FXint h=380);

  /// Save dialog to a stream
  virtual void save(FXStream& store) const;

  /// Load dialog from a stream
  virtual void load(FXStream& store);

  /// Set the current font selection
  void setFontSelection(const FXFontDesc& fontdesc);

  /// Get the current font selection
  %extend {
      FXFontDesc& getFontSelection() const {
          FXFontDesc* fontdesc;
          fontdesc = new FXFontDesc();
          self->getFontSelection(*fontdesc);
          return *fontdesc;
      }
  }

  /// Destructor
  virtual ~FXFontDialog();
  };

class FXPyFontDialog : public FXFontDialog {
    FXDECLARE(FXPyFontDialog)
public:
    FXPyFontDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=600,FXint h=380);
};
}
