/* FXFileDict.i */

%pythonappend FX::FXFileDict::FXFileDict %{
  self.thisown = False
%}
%pythonappend FX::FXPyFileDict::FXPyFileDict %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXDICT_H
#include "FXDict.h"
#endif

namespace FX {


class FXIconDict;


/// Registers stuff to know about the extension
struct FXFileAssoc {
  FXString   command;           /// Command to execute
  FXString   extension;         /// Full extension name
  FXString   mimetype;          /// Mime type name
  FXIcon    *bigicon;           /// Big normal icon
  FXIcon    *bigiconopen;       /// Big open icon
  FXIcon    *miniicon;          /// Mini normal icon
  FXIcon    *miniiconopen;      /// Mini open icon
  FXDragType dragtype;          /// Registered drag type
  FXuint     flags;             /// Flags; 1=cd, 2=term
  };



/**
* The File Association dictionary associates a file extension with a File
* Association record which contains command name, mime type, icons, and other
* information about the file type.  The icons referenced by the file association
* are managed by the Icon Dictionary; this guarantees that each icon is loaded
* only once into memory.
* The associations are determined by the information by the FOX Registry settings;
* each entry under the FILETYPES registry section comprises the command line,
* extension name, large icon, small icon, and mime type:
*
*   command ';' extension ';' bigicon [ ':' bigiconopen ] ';' icon [ ':' iconopen ] ';' mime [ ';' flags ]
*
* For example, the binding for "jpg" could be:
*
*   xv %s &;JPEG Image;bigimage.xpm;miniimage.xpm;image/jpeg;term
*
* The association for a file name is determined by first looking at the entire
* file name, then at the whole extension, and then at sub-extensions.
* For example, "name.tar.gz", "tar.gz", and "gz" can each be given a different
* file association.  Directory names may also be given associations; there is
* no command-line association for a directory, however.  The association for a
* directory is found by first checking the whole pathname, then checking the
* pathname less the first component, and so on.  So, "/usr/local/include",
* "/local/include", and "/include" can each be given their own file associations.
* If the above lookup procedure has not found a file association, the system
* uses a fallback associations: for files, the fallback association is determined
* by the binding "defaultfilebinding".  For directories, the "defaultdirbinding"
* is used, and for executables the "defaultexecbinding" is used.
* The flags field is used for a number of bit-flags; two flags are currently
* defined: 'cd' and 'term'.  The first one is intended to cause a launcher
* to execute the application in the shown directory; the second one is meant
* to indicate that the application is to be ran inside a new terminal.
*/
class FXFileDict : public FXDict {
public:

  /// Registry key used to find fallback executable icons
  static const FXchar defaultExecBinding[];

  /// Registry key used to find fallback directory icons
  static const FXchar defaultDirBinding[];

  /// Registry key used to find fallback document icons
  static const FXchar defaultFileBinding[];

public:

  /**
  * Construct a dictionary mapping file-extension to file associations,
  * using the application registry settings as a source for the bindings.
  * The pointer to the application class is passed down to the icon source
  * which is inside the icon dictionary.
  */
  FXFileDict(FXApp* app);

  /**
  * Construct a dictionary mapping file-extension to file associations,
  * using the specified settings database as a source for the bindings.
  * The pointer to the application class is passed down to the icon source
  * which is inside the icon dictionary.
  */
  FXFileDict(FXApp* app,FXSettings* db);

  /// Change settings database
  void setSettings(FXSettings* s){ settings=s; }

  /// Return settings database
  FXSettings* getSettings() const { return settings; }

  /// Change icon dictionary
  void setIconDict(FXIconDict *icns){ icons=icns; }

  /// Return icon dictionary
  FXIconDict* getIconDict() const { return icons; }

  /**
  * Set icon search path; the initial search path is determined by the
  * "iconpath" registry setting in the SETTINGS section.
  */
  void setIconPath(const FXString& path);

  /// Return current icon search path
  const FXString& getIconPath() const;

  /**
  * Replace file association.
  * The new association is written into the settings database under the
  * FILETYPES section; the format of the association is as follows:
  *
  * <extension> = "<command> ; <type> ; <bigicon> [ : <bigopenicon> ] ; <smallicon> [ : <smalliconopen> ] ; <mimetype>"
  *
  * Where <command> is the command used to launch the application (e.g. "xv %s &"),
  * and <type> is the file type string (e.g. "GIF Image"),
  * <bigicon> and <bigiconopen> are the large icons shown in "Icons" mode,
  * <smallicon> and <smalliconopen> are the small icons shown in "Details" mode,
  * and <mimetype> is the RFC2045 mime type of the file.
  *
  * For example:
  *
  * [FILETYPES]
  * gif="xv %s &;GIF Image;big.xpm:bigopen.xpm;mini.xpm:miniopen.xpm;image/gif"
  * /home/jeroen=";Home;home.xpm;minihome.xpm;application/x-folder"
  *
  */
  FXFileAssoc* replace(const FXchar* ext,const FXchar* str);

  /// Remove file association
  FXFileAssoc* remove(const FXchar* ext);

  /// Find file association from registry
  FXFileAssoc* find(const FXchar* ext);

  /**
  * Determine binding for the given file.
  * The default implementation tries the whole filename first,
  * then tries the extensions.
  * For example, for a file "source.tar.gz":
  *
  *  "source.tar.gz",
  *  "tar.gz",
  *  "gz"
  *
  * are tried in succession.  If no association is found the
  * key "defaultfilebinding" is tried as a fallback association.
  * A NULL is returned if no association of any kind is found.
  */
  virtual FXFileAssoc* findFileBinding(const FXchar* pathname);

  /**
  * Find directory binding from registry.
  * The default implementation tries the whole pathname first,
  * then tries successively smaller parts of the path.
  * For example, a pathname "/usr/people/jeroen":
  *
  *   "/usr/people/jeroen"
  *   "/people/jeroen"
  *   "/jeroen"
  *
  * are tried in succession.  If no bindings are found, the
  * key "defaultdirbinding" is tried as a fallback association.
  * A NULL is returned if no association of any kind is found.
  */
  virtual FXFileAssoc* findDirBinding(const FXchar* pathname);

  /**
  * Determine binding for the given executable.
  * The default implementation returns the fallback binding associated with
  * the key "defaultexecbinding".
  * A NULL is returned if no association of any kind is found.
  */
  virtual FXFileAssoc* findExecBinding(const FXchar* pathname);

  };

class FXPyFileDict : public FXFileDict {
public:
  FXPyFileDict(FXApp* app);
  FXPyFileDict(FXApp* app,FXSettings* db);
};

}
