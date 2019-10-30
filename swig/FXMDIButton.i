/* FXMDIButton.i */

%pythonappend FX::FXMDIDeleteMenu::FXMDIDeleteMenu %{
  self.thisown = False
%}
%pythonappend FX::FXPyMDIDeleteMenu::FXPyMDIDeleteMenu %{
  self.thisown = False
  FXPyRegister(self)
%}
%pythonappend FX::FXMDIRestoreMenu::FXMDIRestoreMenu %{
  self.thisown = False
%}
%pythonappend FX::FXPyMDIRestoreMenu::FXPyMDIRestoreMenu %{
  self.thisown = False
  FXPyRegister(self)
%}
%pythonappend FX::FXMDIMaximizeMenu::FXMDIMaximizeMenu %{
  self.thisown = False
%}
%pythonappend FX::FXPyMDIMaximizeMenu::FXPyMDIMaximizeMenu %{
  self.thisown = False
  FXPyRegister(self)
%}
%pythonappend FX::FXMDIMinimizeMenu::FXMDIMinimizeMenu %{
  self.thisown = False
%}
%pythonappend FX::FXPyMDIMinimizeMenu::FXPyMDIMinimizeMenu %{
  self.thisown = False
  FXPyRegister(self)
%}
%pythonappend FX::FXMDIWindowMenu::FXMDIWindowMenu %{
  self.thisown = False
%}
%pythonappend FX::FXPyMDIWindowMenu::FXPyMDIWindowMenu %{
  self.thisown = False
  FXPyRegister(self)
%}
%pythonappend FX::FXMDIMenu::FXMDIMenu %{
  self.thisown = False
%}
%pythonappend FX::FXPyMDIMenu::FXPyMDIMenu %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXBUTTON_H
#include "FXButton.h"
#endif

namespace FX {

class FXIcon;


/// MDI Delete button
class FXMDIDeleteButton : public FXButton {
public:
  long onPaint(FXObject*,FXSelector,void*);
public:
  /// Constructor
  FXMDIDeleteButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
  virtual FXint getDefaultWidth();
  virtual FXint getDefaultHeight();
  };


/// MDI Restore button
class FXMDIRestoreButton : public FXButton {
  FXDECLARE(FXMDIRestoreButton)
protected:
  FXMDIRestoreButton(){}
private:
  FXMDIRestoreButton(const FXMDIRestoreButton&);
  FXMDIRestoreButton &operator=(const FXMDIRestoreButton&);
public:
  long onPaint(FXObject*,FXSelector,void*);
public:
  /// Constructor
  FXMDIRestoreButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
  virtual FXint getDefaultWidth();
  virtual FXint getDefaultHeight();
  };


/// MDI Maximize button
class FXMDIMaximizeButton : public FXButton {
  FXDECLARE(FXMDIMaximizeButton)
protected:
  FXMDIMaximizeButton(){}
private:
  FXMDIMaximizeButton(const FXMDIMaximizeButton&);
  FXMDIMaximizeButton &operator=(const FXMDIMaximizeButton&);
public:
  long onPaint(FXObject*,FXSelector,void*);
public:
  /// Constructor
  FXMDIMaximizeButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
  virtual FXint getDefaultWidth();
  virtual FXint getDefaultHeight();
  };


/// MDI Minimize button
class FXMDIMinimizeButton : public FXButton {
  FXDECLARE(FXMDIMinimizeButton)
protected:
  FXMDIMinimizeButton(){}
private:
  FXMDIMinimizeButton(const FXMDIMinimizeButton&);
  FXMDIMinimizeButton &operator=(const FXMDIMinimizeButton&);
public:
  long onPaint(FXObject*,FXSelector,void*);
public:
  /// Constructor
  FXMDIMinimizeButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
  virtual FXint getDefaultWidth();
  virtual FXint getDefaultHeight();
  };


/// MDI Window button
class FXMDIWindowButton : public FXMenuButton {
  FXDECLARE(FXMDIWindowButton)
protected:
  FXMDIWindowButton(){}
private:
  FXMDIWindowButton(const FXMDIWindowButton&);
  FXMDIWindowButton &operator=(const FXMDIWindowButton&);
public:
  long onPaint(FXObject*,FXSelector,void*);
public:
  /// Constructor
  FXMDIWindowButton(FXComposite* p,FXPopup* pup,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
  virtual FXint getDefaultWidth();
  virtual FXint getDefaultHeight();
  };


/// MDI Window Menu
class FXMDIMenu : public FXMenuPane {
  FXDECLARE(FXMDIMenu)
private:
  FXIcon *closeicon;
  FXIcon *maximizeicon;
  FXIcon *minimizeicon;
  FXIcon *restoreicon;
protected:
  FXMDIMenu(){}
private:
  FXMDIMenu(const FXMDIMenu&);
  FXMDIMenu &operator=(const FXMDIMenu&);
public:

  /// Construct MDI menu
  FXMDIMenu(FXWindow *owner,FXObject* tgt=NULL);

  /// Destructor
  virtual ~FXMDIMenu();
  };

class FXPyMDIDeleteButton  : public FXMDIDeleteButton {
public:
    FXPyMDIDeleteButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIRestoreButton  : public FXMDIRestoreButton {
public:
    FXPyMDIRestoreButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIMaximizeButton  : public FXMDIMaximizeButton {
public:
    FXPyMDIMaximizeButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIMinimizeButton  : public FXMDIMinimizeButton {
public:
    FXPyMDIMinimizeButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIWindowButton  : public FXMDIWindowButton {
public:
    FXPyMDIWindowButton(FXComposite* p,FXPopup* pup,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIMenu  : public FXMDIMenu {
public:
    FXPyMDIMenu(FXWindow *owner,FXObject* tgt=NULL);
};
}
