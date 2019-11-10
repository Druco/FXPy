/***********************************************************************
 * $Id: FXPy.h,v 1.38 2002/03/29 00:01:42 lyle Exp $
 ***********************************************************************/

#ifndef FXPY_H
#define FXPY_H

// Thread support
#if defined(FXPy_USE_THREADS) && defined(WITH_THREAD)
#define FXPy_WITH_THREADS
#define FXPy_BEGIN_ALLOW_THREADS	Py_BEGIN_ALLOW_THREADS
#define FXPy_END_ALLOW_THREADS		Py_END_ALLOW_THREADS
#else
#undef FXPy_WITH_THREADS
#define FXPy_BEGIN_ALLOW_THREADS
#define FXPy_END_ALLOW_THREADS
#endif

#include "FXColorList.h"

// Global functions
extern void		FXPyCallVoidFunction(FX::FXObject* obj, char* func);
extern FXbool		FXPyCanHandle(FX::FXObject* self,FX::FXSelector sel);
extern long		FXPyHandle(FX::FXObject* self, FX::FXObject* sender,
				   FX::FXSelector sel, void* ptr);
extern void		FXPyRegister(PyObject *pPyObject);
extern void		FXPyUnregister(FX::FXObject *pFXObject);
extern FXObject*	FXPyGetFXObject(PyObject *pPyObject);
extern PyObject*	FXPyGetPyObject(const FX::FXObject *pFXObject);
extern PyObject*	FXPySetDict(PyObject* self, PyObject* args);
extern PyObject*	FXPyMakeShadowObject(const FX::FXObject* obj);
extern FXbool		FXPyRestoreThread();
extern void		FXPySaveThread(FXbool doSave);

// Store a reference to the user data
template <class T>
void FXPySetData(T* item, PyObject *p)
{
    FXbool doSave = FXPyRestoreThread();
    PyObject *oldptr = (PyObject*) item->getData();
    Py_XDECREF(oldptr);
    item->setData((void*) p);
    Py_XINCREF(p);
    FXPySaveThread(doSave);
}


// Returns a new reference to the item data
template <class T>
PyObject* FXPyGetData(const T* item)
{
    PyObject *p = (PyObject*) item->getData();
    FXbool doSave = FXPyRestoreThread();
    Py_XINCREF(p);
    FXPySaveThread(doSave);
    return p;
}


/**
 * Macro to set up class implementation.
 * This is a modified version of the standard FOX macro FXIMPLEMENT();
 * this version's implementation of the virtual handle() function
 * first checks the Python class instance's message map to see if it
 * can handle the incoming message. If not, the regular C++ message
 * mapping takes over as in standard FOX applications.
 */

#define FXPy_IMPLEMENT(classname,baseclassname,mapping,nmappings) \
  FXObject* classname::manufacture(){return new classname;} \
  const FX::FXMetaClass classname::metaClass(#classname,classname::manufacture,&baseclassname::metaClass,mapping,nmappings,sizeof(classname::FXMapEntry)); \
  long classname::handle(FXObject* sender,FXSelector key,void* ptr){ \
    if(FXPyCanHandle(this,key)){ \
      return FXPyHandle(this,sender,key,ptr); \
      } \
    else { \
      const FXMapEntry* me=(const FXMapEntry*)metaClass.search(key); \
      return me ? (this->* me->func)(sender,key,ptr) : baseclassname::handle(sender,key,ptr); \
      } \
    } 


#endif // BAA

#if 1 // BAA Duplicates
namespace FX {

class FXPyObject : public FXObject {
   FXDECLARE(FXPyObject)
public:
  // Constructor
  FXPyObject();
  };

class FXPyMainWindow : public FXMainWindow {
   FXDECLARE(FXPyMainWindow)
protected:
  FXPyMainWindow(){}
public:
  // Constructor
  FXPyMainWindow(FXApp* app,const FXString& name,FXIcon *ic=NULL,FXIcon *mi=NULL,FXuint opts=DECOR_ALL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0,FXint hs=4,FXint vs=4);

  virtual ~FXPyMainWindow();
  };

// Four-way split
class FXPy4Splitter : public FX4Splitter {
  FXDECLARE(FXPy4Splitter)
protected:
  FXPy4Splitter(){}
public:
  // Constructor
  FXPy4Splitter(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h);

  // Alternate constructor takes a target
  FXPy4Splitter(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h);
  };

/**
* Seven-segment (eg LCD/watch style) widget, useful for making
* indicators and timers.  Besides numbers, the seven-segment
* display widget can also display some letters and punctuations.
*/
class FXPy7Segment : public FX7Segment {
  FXDECLARE(FXPy7Segment)
protected:
  FXPy7Segment(){}
 public:
  /// Create a seven segment display
  FXPy7Segment(FXComposite* p,const FXString& text,FXuint opts=SEVENSEGMENT_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
  };

class FXPyAccelTable : public FXAccelTable {
  FXDECLARE(FXPyAccelTable)
public:
  FXPyAccelTable();
};

class FXPyArrowButton : public FXArrowButton {
  FXDECLARE(FXPyArrowButton)
protected:
  FXPyArrowButton(){}
public:
  FXPyArrowButton(FX::FXComposite* p,FX::FXObject* tgt=NULL,FX::FXSelector sel=0,FX::FXuint opts=ARROW_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0,FX::FXint pl=DEFAULT_PAD,FX::FXint pr=DEFAULT_PAD,FX::FXint pt=DEFAULT_PAD,FX::FXint pb=DEFAULT_PAD);
};

class FXPyBMPIcon : public FX::FXBMPIcon {
  FXDECLARE(FXPyBMPIcon)
protected:
  FXPyBMPIcon(){}
public:
  FXPyBMPIcon(FX::FXApp* a,const void *pix=NULL,FX::FXColor clr=FXRGB(192,192,192),FX::FXuint opts=0,FX::FXint w=1,FX::FXint h=1);
  };

class FXPyBMPImage : public FX::FXBMPImage {
  FXDECLARE(FXPyBMPImage)
protected:
  FXPyBMPImage(){}
public:
  FXPyBMPImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
  };

class FXPyBitmap : public FX::FXBitmap {
  FXDECLARE(FXPyBitmap)
protected:
  FXPyBitmap(){}
public:
  FXPyBitmap(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
  };

class FXPyBitmapFrame : public FXBitmapFrame {
  FXDECLARE(FXPyBitmapFrame)
protected:
  FXPyBitmapFrame(){}
public:
  FXPyBitmapFrame(FXComposite* p,FXBitmap *bmp,FXuint opts=FRAME_SUNKEN|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};

class FXPyBitmapView : public FXBitmapView {
  FXDECLARE(FXPyBitmapView)
protected:
  FXPyBitmapView(){}
public:
  FXPyBitmapView(FXComposite* p,FXBitmap *bmp,FXObject* tgt=NULL,FXSelector sel=0, FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyButton : public FXButton {
  FXDECLARE(FXPyButton)
protected:
  FXPyButton(){}
public:
  FXPyButton(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=BUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
  };

class FXPyCursor : public FXCursor {
    FXDECLARE(FXPyCursor)
protected:
    FXPyCursor(){}
public:
    FXPyCursor(FXApp* a,FXStockCursor curid=CURSOR_ARROW);
    FXPyCursor(FXApp* a,const FXuchar* src,const FXuchar* msk,FXint w=32,FXint h=32,FXint hx=0,FXint hy=0);
    FXPyCursor(FXApp* a,const FXColor* pix,FXint w=32,FXint h=32,FXint hx=0,FXint hy=0);
};

class FXPyCanvas : public FXCanvas {
    FXDECLARE(FXPyCanvas)
protected:
    FXPyCanvas(){}
public:
    FXPyCanvas(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyCheckButton : public FXCheckButton {
    FXDECLARE(FXPyCheckButton)
protected:
    FXPyCheckButton(){}
public:
    FXPyCheckButton(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=CHECKBUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyChoiceBox : public FXChoiceBox {
    FXDECLARE(FXPyChoiceBox)
protected:
    FXPyChoiceBox(){}
public:
    FXPyChoiceBox(FXWindow* owner,const FXString& caption,const FXString& text,FXIcon* icon,const FXchar** choices,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

    FXPyChoiceBox(FXWindow* owner,const FXString& caption,const FXString& text,FXIcon* icon,const FXString& choices,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

    FXPyChoiceBox(FXApp* app,const FXString& caption,const FXString& text,FXIcon* icon,const FXchar** choices,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

    FXPyChoiceBox(FXApp* app,const FXString& caption,const FXString& text,FXIcon* icon,const FXString& choices,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyColorBar : public FXColorBar {
    FXDECLARE(FXPyColorBar)
protected:
    FXPyColorBar(){}
public:
    FXPyColorBar(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyColorDialog : public FXColorDialog {
    FXDECLARE(FXPyColorDialog)
protected:
    FXPyColorDialog(){}
public:
  FXPyColorDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyColorItem : public FXColorItem {
    FXDECLARE(FXPyColorItem)
protected:
    FXPyColorItem(){}
public:
  FXPyColorItem(const FX::FXString& text,FX::FXColor clr,void* ptr=NULL);
};

class FXPyColorList : public FXColorList {
    FXDECLARE(FXPyColorList)
protected:
    FXPyColorList(){}
public:
  FXPyColorList(FX::FXComposite *p,FX::FXObject* tgt=NULL,FX::FXSelector sel=0,FX::FXuint opts=LIST_BROWSESELECT,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);
};

class FXPyColorRing : public FXColorRing {
    FXDECLARE(FXPyColorRing)
protected:
    FXPyColorRing(){}
public:
    FXPyColorRing(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyColorSelector : public FXColorSelector {
    FXDECLARE(FXPyColorSelector)
protected:
    FXPyColorSelector(){}
public:
    FXPyColorSelector(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyColorWell : public FXColorWell {
    FXDECLARE(FXPyColorWell)
protected:
    FXPyColorWell(){}
public:
    FXPyColorWell(FXComposite* p,FXColor clr=0,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=COLORWELL_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyColorWheel : public FXColorWheel {
    FXDECLARE(FXPyColorWheel)
protected:
    FXPyColorWheel(){}
public:
    FXPyColorWheel(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyComboBox : public FXComboBox {
    FXDECLARE(FXPyComboBox)
protected:
    FXPyComboBox(){}
public:
    FXPyComboBox(FXComposite *p,FXint cols,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=COMBOBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyComposeContext : public FXComposeContext {
    FXDECLARE(FXPyComposeContext)
protected:
    FXPyComposeContext();
public:
    FXPyComposeContext(FXApp* a,FXWindow* win=NULL,FXSelector sel=0);
};

class FXPyComposite : public FXComposite {
    FXDECLARE(FXPyComposite)
protected:
    FXPyComposite();
public:
public:
  FXPyComposite(FX::FXPyComposite* p,FX::FXuint opts=0,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0);
};

class FXPyDataTarget : public FXDataTarget {
    FXDECLARE(FXPyDataTarget)

private:
  // Associated integer value (if it's an integer)
  FXint intValue;

  // Associated double value (if it's a float)
  FXdouble doubleValue;

  // Associated string value (if it's a string)
  FXString stringValue;

  // Associated boolean value (if it's a boolean)
  FXbool boolValue;

public:

  FXPyDataTarget();
#if 0 // BAA
  FXPyDataTarget(FXObject* tgt,FXSelector sel);
  FXPyDataTarget(FXchar& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXuchar& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXshort& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXushort& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXint& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXuint& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXlong& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXulong& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXfloat& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXdouble& value,FXObject* tgt=NULL,FXSelector sel=0);
  FXPyDataTarget(FXString& value,FXObject* tgt=NULL,FXSelector sel=0);
#else
    FXPyDataTarget(PyObject *value, FXObject* tgt=NULL, FXSelector sel=0);

    // Return its current value
    // PyObject* getValue() const;

    // Set a new value
    void setValue(PyObject* value);

#endif
};

class FXPyDelegator : public FXDelegator {
    FXDECLARE(FXPyDelegator)
protected:
    FXPyDelegator();

public:
    FXPyDelegator(FXObject* target);
};

class FXPyDial : public FXDial {
    FXDECLARE(FXPyDial)
protected:
    FXPyDial();

public:
    FXPyDial(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=DIAL_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyDialogBox : public FXDialogBox {
    FXDECLARE(FXPyDialogBox)
protected:
    FXPyDialogBox();
public:
  FXPyDialogBox(FXApp* a,const FXString& name,FXuint opts=DECOR_TITLE|DECOR_BORDER,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=4,FXint vs=4);

  FXPyDialogBox(FXWindow* owner,const FXString& name,FXuint opts=DECOR_TITLE|DECOR_BORDER,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=4,FXint vs=4);
};

class FXPyDict : public FXDict {
    FXDECLARE(FXPyDict)
public:
    FXPyDict();
};

class FXPyDirBox : public FXDirBox {
    FXDECLARE(FXPyDirBox)
protected:
    FXPyDirBox();

public:
    FXPyDirBox(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_SUNKEN|FRAME_THICK|TREELISTBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyDirDialog : public FXDirDialog {
    FXDECLARE(FXPyDirDialog)
protected:
    FXPyDirDialog();

public:
    FXPyDirDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=400,FXint h=300);
    FXPyDirDialog(FXApp* a,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=400,FXint h=300);
};

class FXPyDirItem : public FXDirItem {
    FXDECLARE(FXPyDirItem)
protected:
    FXPyDirItem();

public:
    FXPyDirItem(const FXString& text,FXIcon* oi=NULL,FXIcon* ci=NULL,void* ptr=NULL);
};

class FXPyDirList : public FXDirList {
    FXDECLARE(FXPyDirList)
protected:
    FXPyDirList();
public:
    FXPyDirList(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyDirSelector : public FXDirSelector {
    FXDECLARE(FXPyDirSelector)
protected:
    FXPyDirSelector();

public:
    FXPyDirSelector(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyDockBar : public FXDockBar {
    FXDECLARE(FXPyDockBar)
protected:
    FXPyDockBar();
public:
    FXPyDockBar(FXComposite* p,FXComposite* q,FXuint opts=LAYOUT_TOP|LAYOUT_LEFT|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
    FXPyDockBar(FXComposite* p,FXuint opts,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=2,FXint pr=3,FXint pt=3,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPyDockHandler : public FXDockHandler {
    FXDECLARE(FXPyDockHandler)
protected:
    FXPyDockHandler();

public:
    FXPyDockHandler(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb);
};

class FXPyDockSite : public FXDockSite {
    FXDECLARE(FXPyDockSite)
protected:
    FXPyDockSite();

public:
    FXPyDockSite(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0,FXint hs=0,FXint vs=0);
};

class FXPyDockTitle : public FXDockTitle {
    FXDECLARE(FXPyDockTitle)
protected:
    FXPyDockTitle();

public:
    FXPyDockTitle(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL|JUSTIFY_CENTER_X|JUSTIFY_CENTER_Y,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};

class FXPyDocument : public FXDocument {
    FXDECLARE(FXPyDocument)
public:
    FXPyDocument();
};

class FXPyDragCorner : FXDragCorner {
    FXDECLARE(FXPyDragCorner)
protected:
    FXPyDragCorner();

public:
    FXPyDragCorner(FXComposite* p);
};

class FXPyDrawable : public FXDrawable {
    FXDECLARE(FXPyDrawable)
public:
    FXPyDrawable();
    FXPyDrawable(FXApp* a,FXint w,FXint h);
};

class FXPyDriveBox : public FXDriveBox {
    FXDECLARE(FXPyDriveBox)
protected:
    FXPyDriveBox();

public:
    FXPyDriveBox(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_SUNKEN|FRAME_THICK|LISTBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyFileDialog : public FXFileDialog {
    FXDECLARE(FXPyFileDialog)
protected:
    FXPyFileDialog();

public:
    FXPyFileDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=500,FXint h=300);
    FXPyFileDialog(FXApp* a,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=500,FXint h=300);
};

class FXPyFileDict : public FXFileDict {
    FXDECLARE(FXPyFileDict)
protected:
    FXPyFileDict();

public:
  FXPyFileDict(FXApp* app);
  FXPyFileDict(FXApp* app,FXSettings* db);
};

class FXPyFileItem : public FXFileItem {
    FXDECLARE(FXPyFileItem)
protected:
    FXPyFileItem();

public:
    FXPyFileItem(const FXString& text,FXIcon* bi=NULL,FXIcon* mi=NULL,void* ptr=NULL);
};

class FXPyFileSelector : public FXFileSelector {
    FXDECLARE(FXPyFileSelector)
protected:
    FXPyFileSelector();

public:
    FXPyFileSelector(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyStream : public FXStream {
    FXDECLARE(FXPyStream)
protected:
    FXPyStream();
public:
    FXPyStream(const FXObject* cont=NULL);
};

class FXPyFoldingItem : public FXFoldingItem {
    FXDECLARE(FXPyFoldingItem)
protected:
    FXPyFoldingItem();

public:
    FXPyFoldingItem(const FXString& text,FXIcon* oi=NULL,FXIcon* ci=NULL,void* ptr=NULL);
};

class FXPyFoldingList : public FXFoldingList {
    FXDECLARE(FXPyFoldingList)
protected:
    FXPyFoldingList();
public:
    FXPyFoldingList(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FOLDINGLIST_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyFont : public FXFont {
    FXDECLARE(FXPyFont)
protected:
    FXPyFont();
public:
    FXPyFont(FXApp* a,const FXString& string);
};

class FXPyFontDialog : public FXFontDialog {
    FXDECLARE(FXPyFontDialog)
protected:
    FXPyFontDialog();

public:
    FXPyFontDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=600,FXint h=380);
};

class FXPyFontSelector : public FXFontSelector {
    FXDECLARE(FXPyFontSelector)
protected:
    FXPyFontSelector();

public:
  FXPyFontSelector(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyFrame : public FXFrame {
    FXDECLARE(FXPyFrame)
protected:
    FXPyFrame();

public:
    FXPyFrame(FX::FXComposite* p,FX::FXuint opts=FRAME_NORMAL,FX::FXint x=0,FX::FXint y=0,FX::FXint w=0,FX::FXint h=0,FX::FXint pl=DEFAULT_PAD,FX::FXint pr=DEFAULT_PAD,FX::FXint pt=DEFAULT_PAD,FX::FXint pb=DEFAULT_PAD);
};

class FXPyGIFCursor : public FXGIFCursor {
    FXDECLARE(FXPyGIFCursor)
protected:
    FXPyGIFCursor();

public:
    FXPyGIFCursor(FXApp* a,const void* pix,FXint hx=0,FXint hy=0);
};

class FXPyGIFIcon : FXGIFIcon {
    FXDECLARE(FXPyGIFIcon)
protected:
    FXPyGIFIcon();

public:
    FXPyGIFIcon(FX::FXApp* a,const void *pix=NULL,FX::FXColor clr=FXRGB(192,192,192),FX::FXuint opts=0,FX::FXint w=1,FX::FXint h=1);
};

class FXPyGIFImage : public FXGIFImage {
    FXDECLARE(FXPyGIFImage)
protected:
    FXPyGIFImage();

public:
    FXPyGIFImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyGUISignal : public FXGUISignal {
    FXDECLARE(FXPyGUISignal)
protected:
    FXPyGUISignal();

public:
    FXPyGUISignal(FXApp* a,FXObject* tgt=NULL,FXSelector sel=0,void* ptr=NULL);
};

class FXPyGradientBar : public FXGradientBar {
    FXDECLARE(FXPyGradientBar)
protected:
    FXPyGradientBar();

public:
    FXPyGradientBar(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);    
};

class FXPyGroupBox : public FXGroupBox {
    FXDECLARE(FXPyGroupBox)
protected:
    FXPyGroupBox();

public:
    FXPyGroupBox(FXComposite* p,const FXString& text,FXuint opts=GROUPBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPyHeaderItem : public FXHeaderItem {
    FXDECLARE(FXPyHeaderItem)
protected:
    FXPyHeaderItem();

public:
    FXPyHeaderItem(const FXString& text,FXIcon* ic=NULL,FXint s=0,void* ptr=NULL);
};

class FXPyHeader : public FXHeader {
    FXDECLARE(FXPyHeader)
protected:
    FXPyHeader();

public:
    FXPyHeader(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=HEADER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyHorizontalFrame : public FXHorizontalFrame {
    FXDECLARE(FXPyHorizontalFrame)
protected:
    FXPyHorizontalFrame();

public:
    FXPyHorizontalFrame(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPyICOIcon : public FXICOIcon {
    FXDECLARE(FXPyICOIcon)
protected:
    FXPyICOIcon();

public:
    FXPyICOIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyICOImage : public FXICOImage {
    FXDECLARE(FXPyICOImage)
protected:
    FXPyICOImage();

public:
    FXPyICOImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyIFFIcon : public FXIFFIcon {
    FXDECLARE(FXPyIFFIcon)
protected:
    FXPyIFFIcon();

public:
    FXPyIFFIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyIFFImage : public FXIFFImage {
    FXDECLARE(FXPyIFFImage)
protected:
    FXPyIFFImage();

public:
    FXPyIFFImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyIcon : public FXIcon {
    FXDECLARE(FXPyIcon)
protected:
    FXPyIcon();

public:
    FXPyIcon(FXApp* a,const FXColor *pix=NULL,FXColor clr=0,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyIconDict : public FXIconDict {
    FXDECLARE(FXPyIconDict)
protected:
    FXPyIconDict();

public:
    FXPyIconDict(FXApp* app,const FXString& p=defaultIconPath);
};

class FXPyIconList : public FXIconList {
    FXDECLARE(FXPyIconList)
protected:
    FXPyIconList();

public:
    FXPyIconList(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=ICONLIST_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyIconItem : public FXIconItem {
    FXDECLARE(FXPyIconItem)
protected:
    FXPyIconItem();
public:
    FXPyIconItem(const FXString& text,FXIcon* bi=NULL,FXIcon* mi=NULL,void* ptr=NULL);
};

class FXPyId : public FXId {
    FXDECLARE(FXPyId)
protected:
    FXPyId();
};

class FXPyImage : public FXImage {
    FXDECLARE(FXPyImage)
protected:
    FXPyImage();

public:
    FXPyImage(FXApp* a,const FXColor *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyImageFrame : public FXImageFrame {
    FXDECLARE(FXPyImageFrame)
protected:
    FXPyImageFrame();

public:
    FXPyImageFrame(FXComposite* p,FXImage *img,FXuint opts=FRAME_SUNKEN|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};

class FXPyImageView : public FXImageView {
    FXDECLARE(FXPyImageView)
protected:
    FXPyImageView();

public:
    FXPyImageView(FXComposite* p,FXImage* img=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyInputDialog : public FXInputDialog {
    FXDECLARE(FXPyInputDialog)
protected:
    FXPyInputDialog();

public:
    FXPyInputDialog(FXWindow* owner,const FXString& caption,const FXString& label,FXIcon* icon=NULL,FXuint opts=INPUTDIALOG_STRING,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
    FXPyInputDialog(FXApp* app,const FXString& caption,const FXString& label,FXIcon* icon=NULL,FXuint opts=INPUTDIALOG_STRING,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyJPGIcon : public FXJPGIcon {
    FXDECLARE(FXPyJPGIcon)
protected:
    FXPyJPGIcon();

public:
    FXPyJPGIcon(FXApp *a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1,FXint q=75);
};

class FXPyJPGImage : public FXJPGImage {
    FXDECLARE(FXPyJPGImage)
protected:
    FXPyJPGImage();

public:
    FXPyJPGImage(FXApp *a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1,FXint q=75);
};

class FXPyKnob : public FXKnob {
    FXDECLARE(FXPyKnob)
protected:
    FXPyKnob();

public:
    FXPyKnob(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=KNOB_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyLabel : public FXLabel {
    FXDECLARE(FXPyLabel)
protected:
    FXPyLabel();

public:
    FXPyLabel(FXComposite* p,const FXString& text,FXIcon* ic=0,FXuint opts=LABEL_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyListBox : public FXListBox {
    FXDECLARE(FXPyListBox)
protected:
    FXPyListBox();

public:
    FXPyListBox(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_SUNKEN|FRAME_THICK|LISTBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyListItem : public FXListItem {
    FXDECLARE(FXPyListItem)
protected:
    FXPyListItem();
public:
    FXPyListItem(const FXString& text,FXIcon* ic=NULL,void* ptr=NULL);
};

class FXPyList : public FXList {
    FXDECLARE(FXPyList)
protected:
    FXPyList();
public:
    FXPyList(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=LIST_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIDeleteButton  : public FXMDIDeleteButton {
    FXDECLARE(FXPyMDIDeleteButton)
protected:
    FXPyMDIDeleteButton();
public:
    FXPyMDIDeleteButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIRestoreButton  : public FXMDIRestoreButton {
    FXDECLARE(FXPyMDIRestoreButton)
protected:
    FXPyMDIRestoreButton();
public:
    FXPyMDIRestoreButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIMaximizeButton  : public FXMDIMaximizeButton {
    FXDECLARE(FXPyMDIMaximizeButton)
protected:
    FXPyMDIMaximizeButton();
public:
    FXPyMDIMaximizeButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIMinimizeButton  : public FXMDIMinimizeButton {
    FXDECLARE(FXPyMDIMinimizeButton)
protected:
    FXPyMDIMinimizeButton();
public:
    FXPyMDIMinimizeButton(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIWindowButton  : public FXMDIWindowButton {
    FXDECLARE(FXPyMDIWindowButton)
protected:
    FXPyMDIWindowButton();
public:
    FXPyMDIWindowButton(FXComposite* p,FXPopup* pup,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIMenu  : public FXMDIMenu {
    FXDECLARE(FXPyMDIMenu)
protected:
    FXPyMDIMenu();

public:
    FXPyMDIMenu(FXWindow *owner,FXObject* tgt=NULL);
};

class FXPyMDIChild : public FXMDIChild {
    FXDECLARE(FXPyMDIChild)
protected:
    FXPyMDIChild();

public:
    FXPyMDIChild(FXMDIClient* p,const FXString& name,FXIcon* ic=NULL,FXPopup* pup=NULL,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMDIClient : public FXMDIClient {
    FXDECLARE(FXPyMDIClient)
protected:
    FXPyMDIClient();

public:
    FXPyMDIClient(FXComposite* p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyMatrix : public FXMatrix {
    FXDECLARE(FXPyMatrix)
protected:
    FXPyMatrix();

public:
    FXPyMatrix(FXComposite *p,FXint n=1,FXuint opts=MATRIX_BY_ROWS,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPyMenuBar : public FXMenuBar {
    FXDECLARE(FXPyMenuBar)
protected:
    FXPyMenuBar();

public:
    FXPyMenuBar(FXComposite* p,FXComposite* q,FXuint opts=LAYOUT_TOP|LAYOUT_LEFT|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
    FXPyMenuBar(FXComposite* p,FXuint opts,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPyMenuButton : public FXMenuButton {
    FXDECLARE(FXPyMenuButton)
protected:
    FXPyMenuButton();

public:
    FXPyMenuButton(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXPopup* pup=NULL,FXuint opts=JUSTIFY_NORMAL|ICON_BEFORE_TEXT|MENUBUTTON_DOWN,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyMenuCaption : public FXMenuCaption {
    FXDECLARE(FXPyMenuCaption)
protected:
    FXPyMenuCaption();

public:
    FXPyMenuCaption(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXuint opts=0);
};

class FXPyMenuCascade : public FXMenuCascade {
    FXDECLARE(FXPyMenuCascade)
protected:
    FXPyMenuCascade();

public:
    FXPyMenuCascade(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXPopup* pup=NULL,FXuint opts=0);
};

class FXPyMenuCheck : public FXMenuCheck {
    FXDECLARE(FXPyMenuCheck)
protected:
    FXPyMenuCheck();

public:
    FXPyMenuCheck(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0);
};

class FXPyMenuCommand : public FXMenuCommand {
    FXDECLARE(FXPyMenuCommand)
protected:
    FXPyMenuCommand();

public:
    FXPyMenuCommand(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0);
};

class FXPyMenuPane : public FXMenuPane {
    FXDECLARE(FXPyMenuPane)
protected:
    FXPyMenuPane();

public:
    FXPyMenuPane(FXWindow* owner,FXuint opts=0);
};

class FXPyMenuRadio : public FXMenuRadio {
    FXDECLARE(FXPyMenuRadio)
protected:
    FXPyMenuRadio();

public:
    FXPyMenuRadio(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0);
};

class FXPyMenuSeparator : public FXMenuSeparator {
    FXDECLARE(FXPyMenuSeparator)
protected:
    FXPyMenuSeparator();

public:
    FXPyMenuSeparator(FXComposite* p,FXuint opts=0);
};

class FXPyMenuTitle : public FXMenuTitle {
    FXDECLARE(FXPyMenuTitle)
protected:
    FXPyMenuTitle();

public:
    FXPyMenuTitle(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXPopup* pup=NULL,FXuint opts=0);
};

class FXPyMessageBox : public FXMessageBox {
    FXDECLARE(FXPyMessageBox)
protected:
    FXPyMessageBox();

public:
    FXPyMessageBox(FXWindow* owner,const FXString& caption,const FXString& text,FXIcon* ic=NULL,FXuint opts=0,FXint x=0,FXint y=0);
    FXPyMessageBox(FXApp* app,const FXString& caption,const FXString& text,FXIcon* ic=NULL,FXuint opts=0,FXint x=0,FXint y=0);
};

class FXPyObjectList : public FXObjectList {
    FXDECLARE(FXPyObjectList)
protected:
    FXPyObjectList();

public:
    FXPyObjectList(FXObject* object);
    FXPyObjectList(FXObject** objects,FXint n);
};

class FXPyOption : public FXOption {
    FXDECLARE(FXPyOption)
protected:
    FXPyOption();

public:
    FXPyOption(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=JUSTIFY_NORMAL|ICON_BEFORE_TEXT,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyOptionMenu : public FXOptionMenu {
    FXDECLARE(FXPyOptionMenu)
protected:
    FXPyOptionMenu();
public:
    FXPyOptionMenu(FXComposite* p,FXPopup* pup=NULL,FXuint opts=JUSTIFY_NORMAL|ICON_BEFORE_TEXT,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};


class FXPyPCXIcon : public FXPCXIcon {
    FXDECLARE(FXPyPCXIcon)
protected:
    FXPyPCXIcon();

public:
    FXPyPCXIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyPCXImage : public FXPCXImage {
    FXDECLARE(FXPyPCXImage)
protected:
    FXPyPCXImage();

public:
    FXPyPCXImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyPNGIcon : public FXPNGIcon {
    FXDECLARE(FXPyPNGIcon)
protected:
    FXPyPNGIcon();

public:
    FXPyPNGIcon(FXApp *a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyPNGImage : public FXPNGImage {
    FXDECLARE(FXPyPNGImage)
protected:
    FXPyPNGImage();

public:
    FXPyPNGImage(FXApp *a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyPPMIcon : public FXPPMIcon {
    FXDECLARE(FXPyPPMIcon)
protected:
    FXPyPPMIcon();

public:
    FXPyPPMIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyPPMImage : public FXPPMImage {
    FXDECLARE(FXPyPPMImage)
protected:
    FXPyPPMImage();

public:
    FXPyPPMImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyPacker : public FXPacker {
    FXDECLARE(FXPyPacker)
protected:
    FXPyPacker();

public:
    FXPyPacker(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPyPicker : public FXPicker {
    FXDECLARE(FXPyPicker)
protected:
    FXPyPicker();

public:
    FXPyPicker(FXComposite* p,const FXString& text,FXIcon* ic=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=BUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyPopup : public FXPopup {
    FXDECLARE(FXPyPopup)
protected:
    FXPyPopup();

public:
    FXPyPopup(FXWindow* owner,FXuint opts=POPUP_VERTICAL|FRAME_RAISED|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyPrintDialog : public FXPrintDialog {
    FXDECLARE(FXPyPrintDialog)
protected:
    FXPyPrintDialog();

public:
    FXPyPrintDialog(FXWindow* owner,const FXString& name,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyProgressBar : public FXProgressBar {
    FXDECLARE(FXPyProgressBar)
protected:
    FXPyProgressBar();

public:
    FXPyProgressBar(FXComposite* p,FXObject* target=NULL,FXSelector sel=0,FXuint opts=PROGRESSBAR_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyProgressDialog : public FXProgressDialog {
    FXDECLARE(FXPyProgressDialog)
protected:
    FXPyProgressDialog();

public:
    FXPyProgressDialog(FXWindow* owner,const FXString& caption,const FXString& label,FXuint opts=PROGRESSDIALOG_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyRASIcon : public FXRASIcon {
    FXDECLARE(FXPyRASIcon)
protected:
    FXPyRASIcon();

public:
    FXPyRASIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyRASImage : public FXRASImage {
    FXDECLARE(FXPyRASImage)
protected:
    FXPyRASImage();

public:
    FXPyRASImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyRGBIcon : public FXRGBIcon {
    FXDECLARE(FXPyRGBIcon)
protected:
    FXPyRGBIcon();

public:
    FXPyRGBIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyRGBImage : public FXRGBImage {
    FXDECLARE(FXPyRGBImage)
protected:
    FXPyRGBImage();

public:
    FXPyRGBImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyRadioButton : public FXRadioButton {
    FXDECLARE(FXPyRadioButton)
protected:
    FXPyRadioButton();

public:
    FXPyRadioButton(FXComposite* p,const FXString& text,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=RADIOBUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyRanged : public FXRanged {
    FXDECLARE(FXPyRanged)
public:
    FXPyRanged();
    FXPyRanged(const FXVec3d& lo,const FXVec3d& hi);
    FXPyRanged(FXdouble xlo,FXdouble xhi,FXdouble ylo,FXdouble yhi,FXdouble zlo,FXdouble zhi);
    FXPyRanged(const FXSphered& sphere);

};

class FXPyRangef : public FXRangef {
    FXDECLARE(FXPyRangef)
public:
    FXPyRangef();
    FXPyRangef(const FXVec3f& lo,const FXVec3f& hi);
    FXPyRangef(FXfloat xlo,FXfloat xhi,FXfloat ylo,FXfloat yhi,FXfloat zlo,FXfloat zhi);
    FXPyRangef(const FXSpheref& sphere);

};

class FXPyRealSlider : public FXRealSlider {
    FXDECLARE(FXPyRealSlider)
protected:
    FXPyRealSlider();

public:
    FXPyRealSlider(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=REALSLIDER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};

class FXPyRealSpinner : public FXRealSpinner {
    FXDECLARE(FXPyRealSpinner)
protected:
    FXPyRealSpinner();

public:
    FXPyRealSpinner(FXComposite *p,FXint cols,FXObject *tgt=NULL,FXSelector sel=0,FXuint opts=REALSPIN_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyRecentFiles : public FXRecentFiles {
    FXDECLARE(FXPyRecentFiles)
public:
    FXPyRecentFiles();
    FXPyRecentFiles(FXApp* a);
    FXPyRecentFiles(FXApp* a,const FXString& gp,FXObject *tgt=NULL,FXSelector sel=0);

};

class FXPyRegistry : public FXRegistry {
    FXDECLARE(FXPyRegistry)
protected:
    FXPyRegistry();

public:
    FXPyRegistry(const FXString& akey,const FXString& vkey);
};

class FXPyReplaceDialog : public FXReplaceDialog {
    FXDECLARE(FXPyReplaceDialog)
protected:
    FXPyReplaceDialog();

public:
    FXPyReplaceDialog(FXWindow* owner,const FXString& caption,FXIcon* ic=NULL,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyRex : public FXRex {
    FXDECLARE(FXPyRex)
public:
    FXPyRex();
    FXPyRex(const FXRex& orig);
    FXPyRex(const FXchar* pattern,FXint mode=REX_NORMAL,FXRexError* error=NULL);
    FXPyRex(const FXString& pattern,FXint mode=REX_NORMAL,FXRexError* error=NULL);

};

class FXPyRootWindow : public FXRootWindow {
    FXDECLARE(FXPyRootWindow)
protected:
    FXPyRootWindow();

public:
    FXPyRootWindow(FXApp* a,FXVisual *vis);
};

class FXPyRuler : public FXRuler {
    FXDECLARE(FXPyRuler)
protected:
    FXPyRuler();

public:
    FXPyRuler(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=RULER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyRulerView : public FXRulerView {
    FXDECLARE(FXPyRulerView)
protected:
    FXPyRulerView();

public:
    FXPyRulerView(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyScrollArea : public FXScrollArea {
    FXDECLARE(FXPyScrollArea)
protected:
    FXPyScrollArea();
};

class FXPyScrollBar : public FXScrollBar {
    FXDECLARE(FXPyScrollBar)
protected:
    FXPyScrollBar();

public:
    FXPyScrollBar(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=SCROLLBAR_VERTICAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyScrollCorner : public FXScrollCorner {
    FXDECLARE(FXPyScrollCorner)
protected:
    FXPyScrollCorner();
public:
    FXPyScrollCorner(FXComposite* p);
};

class FXPyScrollPane : public FXScrollPane {
    FXDECLARE(FXPyScrollPane)
protected:
    FXPyScrollPane();

public:
    FXPyScrollPane(FXWindow* owner,FXint nvis,FXuint opts=0);
};

class FXPyScrollWindow : public FXScrollWindow {
    FXDECLARE(FXPyScrollWindow)
protected:
    FXPyScrollWindow();

public:
    FXPyScrollWindow(FXComposite* p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPySearchDialog : public FXSearchDialog {
    FXDECLARE(FXPySearchDialog)
protected:
    FXPySearchDialog();

public:
    FXPySearchDialog(FXWindow* owner,const FXString& caption,FXIcon* ic=NULL,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPySeparator : public FXSeparator {
    FXDECLARE(FXPySeparator)
protected:
    FXPySeparator();
public:
    FXPySeparator(FXComposite* p,FXuint opts=SEPARATOR_GROOVE|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};

class FXPyHorizontalSeparator : public FXHorizontalSeparator {
    FXDECLARE(FXPyHorizontalSeparator)
protected:
    FXPyHorizontalSeparator();
public:
    FXPyHorizontalSeparator(FXComposite* p,FXuint opts=SEPARATOR_GROOVE|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=1,FXint pr=1,FXint pt=0,FXint pb=0);
};

class FXPyVerticalSeparator : public FXVerticalSeparator {
    FXDECLARE(FXPyVerticalSeparator)
protected:
    FXPyVerticalSeparator();
public:
    FXPyVerticalSeparator(FXComposite* p,FXuint opts=SEPARATOR_GROOVE|LAYOUT_FILL_Y,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=1,FXint pb=1);
};

class FXPySettings : public FXSettings {
    FXDECLARE(FXPySettings)
public:
    FXPySettings();
};

class FXPyShell : public FXShell {
    FXDECLARE(FXPyShell)
protected:
    FXPyShell();
};

class FXPyShutterItem : public FXShutterItem {
    FXDECLARE(FXPyShutterItem)
protected:
    FXPyShutterItem();

public:
    FXPyShutterItem(FXShutter *p,const FXString& text=FXString::null,FXIcon* icon=NULL,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPyShutter : public FXShutter {
    FXDECLARE(FXPyShutter)
protected:
    FXPyShutter();
public:
    FXPyShutter(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPySize : public FXSize {
    FXDECLARE(FXPySize)
public:
    FXPySize();
    FXPySize(const FXSize& s);
    FXPySize(FXshort ww,FXshort hh);

};

class FXPySlider : public FXSlider {
    FXDECLARE(FXPySlider)
protected:
    FXPySlider();

public:
    FXPySlider(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=SLIDER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};

class FXPySpinner : public FXSpinner {
    FXDECLARE(FXPySpinner)
protected:
    FXPySpinner();

public:
    FXPySpinner(FXComposite *p,FXint cols,FXObject *tgt=NULL,FXSelector sel=0,FXuint opts=SPIN_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPySplashWindow : public FXSplashWindow {
    FXDECLARE(FXPySplashWindow)
protected:
    FXPySplashWindow();

public:
    FXPySplashWindow(FXApp* ap,FXIcon* ic,FXuint opts=SPLASH_SIMPLE,FXuint ms=5000);
    FXPySplashWindow(FXWindow* ow,FXIcon* ic,FXuint opts=SPLASH_SIMPLE,FXuint ms=5000);

};

class FXPySplitter : public FXSplitter {
    FXDECLARE(FXPySplitter)
protected:
    FXPySplitter();

public:
    FXPySplitter(FXComposite* p,FXuint opts=SPLITTER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
    FXPySplitter(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts=SPLITTER_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);

};

class FXPySpring : public FXSpring {
    FXDECLARE(FXPySpring)
protected:
    FXPySpring();

public:
    FXPySpring(FXComposite *p,FXuint opts=0,FXint relw=0,FXint relh=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPyStatusBar : public FXStatusBar {
    FXDECLARE(FXPyStatusBar)
protected:
    FXPyStatusBar();

public:
    FXPyStatusBar(FXComposite* p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2,FXint hs=4,FXint vs=0);
};

class FXPyStatusLine : public FXStatusLine {
    FXDECLARE(FXPyStatusLine)
protected:
    FXPyStatusLine();

public:
    FXPyStatusLine(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0);
};

class FXPyStringDict : public FXStringDict {
    FXDECLARE(FXPyStringDict)
public:
    FXPyStringDict();
};

class FXPySwitcher : public FXSwitcher {
    FXDECLARE(FXPySwitcher)
protected:
    FXPySwitcher();

public:
    FXPySwitcher(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING);
};

class FXPyTGAIcon : public FXTGAIcon {
    FXDECLARE(FXPyTGAIcon)
protected:
    FXPyTGAIcon();

public:
    FXPyTGAIcon(FXApp* a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyTGAImage : public FXTGAImage {
    FXDECLARE(FXPyTGAImage)
protected:
    FXPyTGAImage();

public:
    FXPyTGAImage(FXApp* a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyTIFIcon : public FXTIFIcon {
    FXDECLARE(FXPyTIFIcon)
protected:
    FXPyTIFIcon();

public:
    FXPyTIFIcon(FXApp *a,const void *pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyTIFImage : public FXTIFImage {
    FXDECLARE(FXPyTIFImage)
protected:
    FXPyTIFImage();

public:
    FXPyTIFImage(FXApp *a,const void *pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyTabBar : public FXTabBar {
    FXDECLARE(FXPyTabBar)
protected:
    FXPyTabBar();

public:
    FXPyTabBar(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TABBOOK_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING);
};

class FXPyTabBook : public FXTabBook {
    FXDECLARE(FXPyTabBook)
protected:
    FXPyTabBook();

public:
    FXPyTabBook(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TABBOOK_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING);
};

class FXPyTabItem : public FXTabItem {
    FXDECLARE(FXPyTabItem)
protected:
    FXPyTabItem();

public:
    FXPyTabItem(FXTabBar* p,const FXString& text,FXIcon* ic=0,FXuint opts=TAB_TOP_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyTableItem : public FXTableItem {
    FXDECLARE(FXPyTableItem)
protected:
    FXPyTableItem();

public:
    FXPyTableItem(const FXString& text,FXIcon* ic=NULL,void* ptr=NULL);
};

class FXPyComboTableItem : public FXComboTableItem {
    FXDECLARE(FXPyComboTableItem)
protected:
    FXPyComboTableItem();
public:
    FXPyComboTableItem(const FXString& text,FXIcon* ic=NULL,void* ptr=NULL);
};

class FXPyTable : public FXTable {
    FXDECLARE(FXPyTable)
protected:
    FXPyTable();
public:
    FXPyTable(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_MARGIN,FXint pr=DEFAULT_MARGIN,FXint pt=DEFAULT_MARGIN,FXint pb=DEFAULT_MARGIN);
};
class FXPyText : public FXText {
    FXDECLARE(FXPyText)
protected:
    FXPyText();

public:
    FXPyText(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2);
};

class FXPyTextField : public FXTextField {
    FXDECLARE(FXPyTextField)
protected:
    FXPyTextField();

public:
    FXPyTextField(FXComposite* p,FXint ncols,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TEXTFIELD_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyToggleButton : public FXToggleButton {
    FXDECLARE(FXPyToggleButton)
protected:
    FXPyToggleButton();

public:
    FXPyToggleButton(FXComposite* p,const FXString& text1,const FXString& text2,FXIcon* icon1=NULL,FXIcon* icon2=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TOGGLEBUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyToolBar : public FXToolBar {
    FXDECLARE(FXPyToolBar)
protected:
    FXPyToolBar();

public:
    FXPyToolBar(FXComposite* p,FXComposite* q,FXuint opts=LAYOUT_TOP|LAYOUT_LEFT|LAYOUT_FILL_X,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=3,FXint pr=3,FXint pt=2,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
    FXPyToolBar(FXComposite* p,FXuint opts,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=2,FXint pr=3,FXint pt=3,FXint pb=2,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);

};

class FXPyToolBarGrip : public FXToolBarGrip {
    FXDECLARE(FXPyToolBarGrip)
protected:
    FXPyToolBarGrip();

public:
    FXPyToolBarGrip(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TOOLBARGRIP_SINGLE,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0);
};

class FXPyToolBarShell : public FXToolBarShell {
    FXDECLARE(FXPyToolBarShell)
protected:
    FXPyToolBarShell();

public:
    FXPyToolBarShell(FXWindow* owner,FXuint opts=FRAME_RAISED|FRAME_THICK,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint hs=4,FXint vs=4);
};

class FXPyToolBarTab : public FXToolBarTab {
    FXDECLARE(FXPyToolBarTab)
protected:
    FXPyToolBarTab();

public:
    FXPyToolBarTab(FXComposite* p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_RAISED,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyToolTip : public FXToolTip {
    FXDECLARE(FXPyToolTip)
protected:
    FXPyToolTip();

public:
    FXPyToolTip(FXApp* a,FXuint opts=TOOLTIP_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyTopWindow : public FXTopWindow {
    FXDECLARE(FXPyTopWindow)
protected:
    FXPyTopWindow();

public:
    FXPyTopWindow(FXApp* ap,const FXString& name,FXIcon *ic,FXIcon *mi,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs);
    FXPyTopWindow(FXWindow* ow,const FXString& name,FXIcon *ic,FXIcon *mi,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs);

};

class FXPyTranslator : public FXTranslator {
    FXDECLARE(FXPyTranslator)
protected:
    FXPyTranslator();

public:
    FXPyTranslator(FXApp* a);
};

class FXPyTreeItem : public FXTreeItem {
    FXDECLARE(FXPyTreeItem)
protected:
    FXPyTreeItem();

public:
    FXPyTreeItem(const FXString& text,FXIcon* oi=NULL,FXIcon* ci=NULL,void* ptr=NULL);

};

class FXPyTreeList : public FXTreeList {
    FXDECLARE(FXPyTreeList)
protected:
    FXPyTreeList();
public:
    FXPyTreeList(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TREELIST_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyTreeListBox : public FXTreeListBox {
    FXDECLARE(FXPyTreeListBox)
protected:
    FXPyTreeListBox();

public:
    FXPyTreeListBox(FXComposite *p,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=FRAME_SUNKEN|FRAME_THICK|TREELISTBOX_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyTriStateButton : public FXTriStateButton {
    FXDECLARE(FXPyTriStateButton)
protected:
    FXPyTriStateButton();

public:
    FXPyTriStateButton(FXComposite* p,const FXString& text1,const FXString& text2,const FXString& text3,FXIcon* icon1=NULL,FXIcon* icon2=NULL,FXIcon* icon3=NULL,FXObject* tgt=NULL,FXSelector sel=0,FXuint opts=TOGGLEBUTTON_NORMAL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_PAD,FXint pr=DEFAULT_PAD,FXint pt=DEFAULT_PAD,FXint pb=DEFAULT_PAD);
};

class FXPyVerticalFrame : public FXVerticalFrame {
    FXDECLARE(FXPyVerticalFrame)
protected:
    FXPyVerticalFrame();

public:
    FXPyVerticalFrame(FXComposite *p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=DEFAULT_SPACING,FXint pr=DEFAULT_SPACING,FXint pt=DEFAULT_SPACING,FXint pb=DEFAULT_SPACING,FXint hs=DEFAULT_SPACING,FXint vs=DEFAULT_SPACING);
};

class FXPyVisual : public FXVisual {
    FXDECLARE(FXPyVisual)
protected:
    FXPyVisual();

public:
    FXPyVisual(FXApp* a,FXuint flgs,FXuint d=32);
};

class FXPyWindow : public FXWindow {
    FXDECLARE(FXPyWindow)
protected:
    FXPyWindow();

public:
    FXPyWindow(FXComposite* p,FXuint opts=0,FXint x=0,FXint y=0,FXint w=0,FXint h=0);
};

class FXPyWizard : public FXWizard {
    FXDECLARE(FXPyWizard)
protected:
    FXPyWizard();

public:
    FXPyWizard(FXApp* a,const FXString& name,FXImage *image,FXuint opts=DECOR_TITLE|DECOR_BORDER|DECOR_RESIZE,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=10,FXint vs=10);
    FXPyWizard(FXWindow* owner,const FXString& name,FXImage *image,FXuint opts=DECOR_TITLE|DECOR_BORDER|DECOR_RESIZE,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=10,FXint pr=10,FXint pt=10,FXint pb=10,FXint hs=10,FXint vs=10);

};

class FXPyXBMIcon : public FXXBMIcon {
    FXDECLARE(FXPyXBMIcon)
protected:
    FXPyXBMIcon();

public:
    FXPyXBMIcon(FXApp* a,const FXuchar *pixels=NULL,const FXuchar *mask=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyXBMImage : public FXXBMImage {
    FXDECLARE(FXPyXBMImage)
protected:
    FXPyXBMImage();

public:
    FXPyXBMImage(FXApp* a,const FXuchar *pixels=NULL,const FXuchar *mask=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyXPMIcon : public FXXPMIcon {
    FXDECLARE(FXPyXPMIcon)
protected:
    FXPyXPMIcon();

public:
    FXPyXPMIcon(FXApp* a,const FXchar **pix=NULL,FXColor clr=FXRGB(192,192,192),FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyXPMImage : public FXXPMImage {
    FXDECLARE(FXPyXPMImage)
protected:
    FXPyXPMImage();

public:
    FXPyXPMImage(FXApp* a,const FXchar **pix=NULL,FXuint opts=0,FXint w=1,FXint h=1);
};

class FXPyCommandGroup : public FXCommandGroup {
    FXDECLARE(FXPyCommandGroup)
public:
    FXPyCommandGroup();
};

class FXPyUndoList : public FXUndoList {
    FXDECLARE(FXPyUndoList)
public:
    FXPyUndoList();
};

class FXPyCURCursor : public FXCURCursor {
    FXDECLARE(FXPyCURCursor)
protected:
    FXPyCURCursor();
public:
    FXPyCURCursor(FXApp* a,const void* pix);
};

}
#endif
