/* FXMainWindow.i */

extern void FXPyRegister(PyObject *pPyObject);

%pythonappend FX::FXMainWindow::FXMainWindow %{
  self.thisown = False
%}

%pythonappend FX::FXPyMainWindow::FXPyMainWindow %{
  self.thisown = False
  FXPyRegister(self)
%}

#ifndef FXTOPWINDOW_H
#include "FXTopWindow.h"
#endif
%{
extern long		FXPyHandle(FXObject* self, FXObject* sender, FXSelector sel, void* ptr);
extern FXbool		FXPyCanHandle(FXObject* self,FXSelector sel);
extern void FXPyRegister(PyObject *pPyObject);

// Returns a reference to the dictionary
static FXDict& FXPyGetObjectDict()
{
	static FXDict dict;
	return dict;
}

// Register
void FXPyRegister(PyObject *pPyObject)
{
	Py_INCREF(pPyObject); // FIXME: Artificially increments refcount
	FXObject *pFXObject = 0;
#if 1 // BAA *** Very Important
	SWIG_ConvertPtr(pPyObject, (void**) &pFXObject, SWIGTYPE_p_FX__FXObject, 0);
#endif
	FXString key = FXStringFormat("%p", pFXObject);
//	FXbool doSave = FXPyRestoreThread();
	FXPyGetObjectDict().insert(key.text(), pPyObject);
//	FXPySaveThread(doSave);
}

// Unregister
void FXPyUnregister(FXObject *pFXObject)
{
	FXString key = FXStringFormat("%p", pFXObject);
//	FXbool doSave = FXPyRestoreThread();
	PyObject *pPyObject = (PyObject*) FXPyGetObjectDict().find(key.text());
	if (pPyObject != NULL) {
		FXPyGetObjectDict().remove(key.text());
	}
//	FXPySaveThread(doSave);
}


// Given a Python class instance which is a shadow for some
// real C++ object, return the corresponding FXObject pointer.
FXObject *FXPyGetFXObject(PyObject *pPyObject)
{
	FXObject *obj = 0;
#if 1 // BAA ***** Very Important
 	SWIG_ConvertPtr(pPyObject, (void**) &obj, SWIGTYPE_p_FX__FXObject, 0);
 	assert(obj != 0);
#endif
 	return obj;
}
/*
*  If the input object has a Python shadow class instance
*  counterpart, return a new reference to that instance.
*  Otherwise return NULL.
*/
PyObject *FXPyGetPyObject(const FXObject *pFXObject)
{
	PyObject *pPyObject = NULL;
	FXString key = FXStringFormat("%p", pFXObject);
//	FXbool doSave = FXPyRestoreThread();
	pPyObject = (PyObject*) FXPyGetObjectDict().find(key.text());
	Py_XINCREF(pPyObject);
//	FXPySaveThread(doSave);
	return pPyObject;
}

%}
namespace FX {

/**
* The Main Window is usually the central window of an application.  Applications
* may have any number of main windows.
* When a MainWindow is closed, it sends a SEL_CLOSE message to its target; the target
* should return 0 if there is no objection against proceeding with the close, and
* return 1 otherwise.
* After the SEL_CLOSE message has been sent and no objection was raised, the main
* window will delete itself.
*/
class FXMainWindow : public FXTopWindow {
public:

  /// Construct a main window
  FXMainWindow(FXApp* a,const FXString& name,FXIcon *ic=NULL,FXIcon *mi=NULL,FXuint opts=DECOR_ALL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0,FXint hs=0,FXint vs=0);

  /// Create server-side resources
  virtual void create();

  /// Destructor
  virtual ~FXMainWindow();
  };


class FXPyMainWindow : public FXMainWindow {
public:
  // Constructor
  FXPyMainWindow(FXApp* app,const FXString& name,FXIcon *ic=NULL,FXIcon *mi=NULL,FXuint opts=DECOR_ALL,FXint x=0,FXint y=0,FXint w=0,FXint h=0,FXint pl=0,FXint pr=0,FXint pt=0,FXint pb=0,FXint hs=4,FXint vs=4);
  %pragma(python) addtomethod = "__init__:FXPyRegister(self)"
  };
}
