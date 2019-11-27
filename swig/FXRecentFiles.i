/* FXRecentFiles.i */

%pythonappend FX::FXRecentFiles::FXRecentFiles %{
  self.thisown = False
%}
%pythonappend FX::FXPyRecentFiles::FXPyRecentFiles %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXOBJECT_H
#include "FXObject.h"
#endif

namespace FX {


class FXApp;


/**
* The recent files object manages a most recently used (MRU) file list by
* means of the standard system registry.
* When connected to a widget, like a menu command, the recent files object
* updates the menu commands label to the associated recent file name; when
* the menu command is invoked, the recent file object sends its target a
* SEL_COMMAND message with the message data set to the associated file name,
* of the type const char*.
* When adding or removing file names, the recent files object automatically
* updates the system registry to record these changes.
*/
class FXRecentFiles : public FXObject {
public:
  long onCmdClear(FXObject*,FXSelector,void*);
  long onCmdFile(FXObject*,FXSelector,void*);
  long onUpdFile(FXObject*,FXSelector,void*);
  long onUpdAnyFiles(FXObject*,FXSelector,void*);
public:
  enum{
    ID_CLEAR,
    ID_ANYFILES,
    ID_FILE_1,
    ID_FILE_2,
    ID_FILE_3,
    ID_FILE_4,
    ID_FILE_5,
    ID_FILE_6,
    ID_FILE_7,
    ID_FILE_8,
    ID_FILE_9,
    ID_FILE_10,
    ID_LAST
    };
public:

  /// Make new recent files group, using global application instance
  FXRecentFiles();

  /// Make new recent files group with default groupname
  FXRecentFiles(FXApp* a);

  /// Make new recent files group with groupname gp
  FXRecentFiles(FXApp* a,const FXString& gp,FXObject *tgt=NULL,FXSelector sel=0);

  /// Get application
  FXApp* getApp() const { return app; }

  /// Change number of files we're tracking
  void setMaxFiles(FXint mx){ maxfiles=mx; }

  /// Return the maximum number of files being tracked
  FXint getMaxFiles() const { return maxfiles; }

  /// Set group name
  void setGroupName(const FXString& name){ group=name; }

  /// Return group name
  FXString getGroupName() const { return group; }

  /// Change the target
  void setTarget(FXObject *t){ target=t; }

  /// Get the target
  FXObject *getTarget() const { return target; }

  /// Change the message
  void setSelector(FXSelector sel){ message=sel; }

  /// Return the message id
  FXSelector getSelector() const { return message; }

  /// Obtain the filename at index
  FXString getFile(FXint index) const;

  /// Change the filename at index
  void setFile(FXint index,const FXString& filename);

  /// Append a file
  void appendFile(const FXString& filename);

  /// Remove a file
  void removeFile(const FXString& filename);

  /// Clear the list of files
  void clear();

  /// Save to a stream
  virtual void save(FXStream& store) const;

  /// Load from a stream
  virtual void load(FXStream& store);

  /// Destructor
  virtual ~FXRecentFiles();
  };

class FXPyRecentFiles : public FXRecentFiles {
    FXDECLARE(FXPyRecentFiles)
public:
    FXPyRecentFiles();
    FXPyRecentFiles(FXApp* a);
    FXPyRecentFiles(FXApp* a,const FXString& gp,FXObject *tgt=NULL,FXSelector sel=0);

};
}
