/* FXDriveBox.i */

%pythonappend FX::FXDriveBox::FXDriveBox %{
  self.thisown = False
%}
%pythonappend FX::FXPyDriveBox::FXPyDriveBox %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXLISTBOX_H
#include "FXListBox.h"
#endif

namespace FX {


class FXIcon;
class FXFileDict;

/// Drive Box options
enum {
  DRIVEBOX_NO_OWN_ASSOC = 0x00020000    /// Do not create associations for files
  };


/// Directory Box
class FXDriveBox : public FXListBox {
public:
  long onListChanged(FXObject*,FXSelector,void*);
  long onListClicked(FXObject*,FXSelector,void*);
  long onCmdSetValue(FXObject*,FXSelector,void*);
  long onCmdSetStringValue(FXObject*,FXSelector,void*);
  long onCmdGetStringValue(FXObject*,FXSelector,void*);
public:

  /// Constructor
  FXDriveBox(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_SUNKEN|FRAME_THICK|LISTBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
  FXbool setDrive(const FXString& drive);
  FXString getDrive() const;
  void setAssociations(FXFileDict* assoc);
  FXFileDict* getAssociations() const { return associations; }
  };

class FXPyDriveBox : public FXDriveBox {
    FXDECLARE(FXPyDriveBox)
public:
    FXPyDriveBox(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_SUNKEN|FRAME_THICK|LISTBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};


}
