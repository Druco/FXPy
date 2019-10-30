// SWIG Interface to FOX1.6
%module FXPy
%{
#include "fxdefs.h"
#include "FXString.h"
#include "fxdefs2.h"
#include "fx.h"
#include "FXApp.h"
#include "FXTranslator.h"
#include "FXGradientBar.h"
#include "FXJPGIcon.h"
#include "FXJPGImage.h"
#include "FXPNGIcon.h"
#include "FXPNGImage.h"
#include "FXVec2d.h"
#include "FXVec3d.h"
#include "FXVec4d.h"
#include "FXQuatd.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
#include "FXQuatf.h"
#include "FXVec2d.h"
#include "FXVec3d.h"
#include "FXVec4d.h"
#include "FXRanged.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
#include "FXRangef.h"
#include "FXSettings.h"
#include "FXVec2d.h"
#include "FXVec3d.h"
#include "FXVec4d.h"
#include "FXSphered.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
#include "FXSpheref.h"
#include "FXTIFIcon.h"
#include "FXTIFImage.h"
#include "FXVec2d.h"
#include "FXVec2f.h"
#include "FXVec2d.h"
#include "FXVec3d.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec2d.h"
#include "FXVec3d.h"
#include "FXVec4d.h"
#include "FXVec2f.h"
#include "FXVec3f.h"
#include "FXVec4f.h"
#include "FXVec2d.h"
#include "FXMat3d.h"
#include "FXMat3f.h"
#include "FXMat4d.h"
#include "FXMat4f.h"
#include "FXMatrix.h"
#include "FXExtentd.h"
#include "FXVec2f.h"
#include "FXExtentf.h"
#include "FX4Splitter.h"
#include "FXColorList.h"
#include "FXComposeContext.h"
#include "FXMemMap.h"
#include "FXPy.h"

namespace FX {
class                          FXObject;
class                          FXStream;
class                          FXString;

typedef char                   FXchar;
typedef unsigned char          FXuchar;
typedef FXuchar                FXbool;
typedef unsigned short         FXushort;
typedef short                  FXshort;
typedef unsigned int           FXuint;
typedef int                    FXint;
typedef float                  FXfloat;
typedef double                 FXdouble;
typedef FX::FXObject              *FXObjectPtr;
typedef unsigned int           FXColor;

typedef unsigned long long     FXulong;
typedef long long              FXlong;

// Integral types large enough to hold value of a pointer
typedef long                   FXival;
typedef unsigned long          FXuval;


// Handle to something in server
typedef unsigned long          FXID;

typedef unsigned long long     FXulong;
typedef long long              FXlong;
typedef wchar_t                FXwchar;
typedef unsigned short         FXnchar;


// Time since January 1, 1970 (UTC)
typedef long                   FXTime;

// Pixel type (could be color index)
typedef unsigned long          FXPixel;

// RGBA pixel value
typedef FXuint                 FXColor;

// Hot key
typedef FXuint                 FXHotKey;

// Drag type
typedef FXID                   FXDragType;

// Input source handle type
typedef FXint                  FXInputHandle;

// Raw event type
typedef _XEvent                FXRawEvent;

/* This is exposed as a global variable */
PyObject* messageTypeNames;

/* Adds a new list object, containing the names of FOX message types */
void FXPy_InitLists(PyObject* dict) {
  if(!messageTypeNames){
    /* Create the list */
    messageTypeNames = PyList_New(SEL_LAST);
    for (int i = 0; i < SEL_LAST; i++) {
      PyList_SetItem(messageTypeNames, i, PyString_FromString(FXDebugTarget::messageTypeName[i]));
      }
    }
  }

};

%}

// %rename FXMainWindow FX_MainWindow;
// %rename FXPyMainWindow FXMainWindow;


%include pytypemaps.i
%include renames.i
%include fxdefs.i
%include FXObject.i
%include FXApp.i
%include FXDataTarget.i
%include FXDebugTarget.i
%include FXDelegator.i
%include FXDict.i
%include FXDocument.i
%include FXIconSource.i
%include FXId.i
%include FXRecentFiles.i
%include FXTranslator.i
%include FXUndoList.i
%include FXFileDict.i
%include FXString.i
%include FXId.i
%include FXDrawable.i
%include FXWindow.i
%include FXComposite.i
%include FXShell.i
%include FXTopWindow.i
%include FXMainWindow.i
%include FXComposite.i
%include FXDCWindow.i
%include FXDialogBox.i
%include FXDragCorner.i
%include FXFileDialog.i
%include FXFont.i
%include FXFrame.i
%include FXHeader.i
%include FXGradientBar.i
%include FXIconDict.i
%include FXImage.i
%include FXGIFImage.i
%include FXIcon.i
%include FXImageFrame.i
%include FXInputDialog.i
%include FXJPGIcon.i
%include FXJPGImage.i
%include FXKnob.i
%include FXLabel.i
%include FXMDIButton.i
%include FXMDIChild.i
%include FXMDIClient.i
%include FXMemoryStream.i
%include FXMenuButton.i
%include FXMenuCaption.i
%include FXMenuCascade.i
%include FXMenuCommand.i
%include FXMenuRadio.i
%include FXMenuSeparator.i
%include FXMenuTitle.i
%include FXMessageBox.i
%include FXOptionMenu.i
%include FXPCXIcon.i
%include FXPCXImage.i
%include FXPNGIcon.i
%include FXPNGImage.i
%include FXPPMIcon.i
%include FXPPMImage.i
%include FXPacker.i
%include FXFontSelector.i
%include FXGroupBox.i
%include FXPipe.i
%include FXPopup.i
%include FXPrintDialog.i
%include FXProgressBar.i
%include FXProgressDialog.i
%include FXQuatd.i
%include FXQuatf.i
%include FXRGBIcon.i
%include FXRGBImage.i
%include FXRadioButton.i
%include FXRanged.i
%include FXRangef.i
%include FXRealSlider.i
%include FXRealSpinner.i
%include FXRegion.i
%include FXReplaceDialog.i
%include FXRootWindow.i
%include FXRuler.i
%include FXScrollArea.i
%include FXRulerView.i
%include FXImageView.i
%include FXTable.i
%include FXFoldingList.i
%include FXIconList.i
%include FXTreeList.i
%include FXScrollBar.i
%include FXScrollWindow.i
%include FXSearchDialog.i
%include FXSeparator.i
%include FXSettings.i
%include FXShell.i
%include FXSize.i
%include FXSlider.i
%include FXSphered.i
%include FXSpheref.i
%include FXSpinner.i
%include FXSplashWindow.i
%include FXSplitter.i
%include FXStatusLine.i
%include FXStringDict.i
%include FXSwitcher.i
%include FXTGAIcon.i
%include FXTGAImage.i
%include FXTIFIcon.i
%include FXTIFImage.i
%include FXTabBar.i
%include FXTabBook.i
%include FXTabItem.i
%include FXText.i
%include FXTextField.i
%include FXToggleButton.i
%include FXToolBarShell.i
%include FXToolBarTab.i
%include FXToolTip.i
%include FXTreeListBox.i
%include FXTriStateButton.i
%include FXVec2d.i
%include FXVec2f.i
%include FXVec3d.i
%include FXVec3f.i
%include FXVec4d.i
%include FXVec4f.i
%include FXHorizontalFrame.i
%include FXStatusBar.i
%include FXVerticalFrame.i
%include FXShutter.i
%include FXVisual.i
%include FXWindow.i
%include FXWizard.i
%include FXXBMIcon.i
%include FXXBMImage.i
%include FXXPMIcon.i
%include FXXPMImage.i
%include FXExtentd.i
%include FXExtentf.i
%include FXMainWindow.i
%include FXButton.i
%include FXPicker.i
%include FX4Splitter.i
%include FXAccelTable.i
%include FXArrowButton.i
%include FXBitmap.i
%include FXBitmapFrame.i
%include FXBitmapView.i
%include FXCanvas.i
%include FXCheckButton.i
%include FXChoiceBox.i
%include FXColorBar.i
%include FXColorDialog.i
%include FXColorRing.i
%include FXColorSelector.i
%include FXColorWell.i
%include FXColorWheel.i
%include FXCursor.i
%include FXDirDialog.i
%include FXDirSelector.i
%include FXDockBar.i
%include FXToolBar.i
%include FXDockHandler.i
%include FXToolBarGrip.i
%include FXDockSite.i
%include FXDrawable.i
%include FXFileSelector.i
%include FXFileStream.i
%include FXFontDialog.i
%include FXGIFCursor.i
%include FXGIFIcon.i
%include FX7Segment.i
%include FXBMPImage.i
%include FXBMPIcon.i
%include FXCURCursor.i
%include FXComboBox.i
%include FXDC.i
%include FXDCPrint.i
%include FXDial.i
%include FXDirBox.i
%include FXDockTitle.i
%include FXList.i
%include FXColorList.i
%include FXListBox.i
%include FXDriveBox.i
%include FXDirList.i
%include FXFileList.i
%include FXMatrix.i
%include FXMenuBar.i
%include FXMenuCheck.i
%include FXMenuPane.i
%include FXScrollPane.i
%include FXStream.i
%include FXRectangle.i
%include FXRegistry.i


extern PyObject* FXPySetDict(PyObject *, PyObject *args);

%pythoncode %{
FXPySetDict(None, vars())
        
def FXMAPTYPES(self, typelo, typehi, func):
    if not hasattr(self, "FXMSGMAP"):
        self.FXMSGMAP = []
    keylo = MKUINT(MINKEY, typelo)
    keyhi = MKUINT(MAXKEY, typehi)
    tup = (keylo, keyhi, func)
    self.FXMSGMAP.append(tup)

def FXMAPTYPE(self, type, func):
    if not hasattr(self, "FXMSGMAP"):
        self.FXMSGMAP = []
    keylo = MKUINT(MINKEY, type)
    keyhi = MKUINT(MAXKEY, type)
    tup = (keylo, keyhi, func)
    self.FXMSGMAP.append(tup)

# Here's how we handle mapping message identifiers to method calls at
# the Python level. Each object instance has a list member called
# FXMSGMAP which maps a range of identifiers to a method call.
def FXMAPFUNC(self, type, id, func):
    if not hasattr(self, "FXMSGMAP"):
        self.FXMSGMAP = []
    keylo = MKUINT(id, type)
    keyhi = MKUINT(id, type)
    tup = (keylo, keyhi, func)
    self.FXMSGMAP.append(tup)

def FXMAPFUNCS(self, type, keylo, keyhi, func):
    if not hasattr(self, "FXMSGMAP"):
        self.FXMSGMAP = []
    keylo = MKUINT(keylo, type)
    keyhi = MKUINT(keyhi, type)
    tup = (keylo, keyhi, func)
    self.FXMSGMAP.append(tup)

%}

%insert("wrapper") %{
#ifdef __cplusplus
}
#endif
extern PyObject* FXWrapEvent(FX::FXEvent* ptr);
PyObject* FXWrapEvent(FX::FXEvent* ptr) {
    PyObject* result = SWIG_NewPointerObj(SWIG_as_voidptr(ptr), SWIGTYPE_p_FX__FXEvent, 0 );
    return result;
}
#ifdef __cplusplus
extern "C" {
#endif
%}
