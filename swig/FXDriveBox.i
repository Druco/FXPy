/* FXDriveBox.i */

%pythonappend FX::FXDriveBox::FXDriveBox %{
  self.thisown = False
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

  /// Create server-side resources
  virtual void create();

  /// Detach server-side resources
  virtual void detach();

  /// Destroy server-side resources
  virtual void destroy();

  /// Save to stream
  virtual void save(FXStream& store) const;

  /// Load from stream
  virtual void load(FXStream& store);

  /// Set current drive
  FXbool setDrive(const FXString& drive);

  /// Return current drive
  FXString getDrive() const;

  /// Change file associations
  void setAssociations(FXFileDict* assoc);

  /// Return file associations
  FXFileDict* getAssociations() const { return associations; }

  /// Destructor
  virtual ~FXDriveBox();
  };

}
