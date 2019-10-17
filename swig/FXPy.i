// SWIG Interface to FOX1.6
%module FXPy
%{
#include "fxdefs.h"
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
};
#include "FXString.h"
%}

%include pytypemaps.i

%pythonappend FX::FXButton::FXButton %{
  self.thisown = False
%}

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
//%include FXTable.i
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
//%include FXFontSelector.i
%include FXFrame.i
%include FXHeader.i
//%include FXGIFImage.i
%include FXGradientBar.i
%include FXIconDict.i
%include FXImage.i
%include FXGIFImage.i
%include FXIcon.i
%include FXImageFrame.i
//%include FXImageView.i
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
//%include FXPicker.i
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
//%include FXRegistry.i
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
//%include FXScrollPane.i
%include FXScrollWindow.i
%include FXSearchDialog.i
%include FXSeparator.i
%include FXSettings.i
%include FXShell.i
//%include FXShutter.i
%include FXSize.i
%include FXSlider.i
%include FXSphered.i
%include FXSpheref.i
%include FXSpinner.i
%include FXSplashWindow.i
%include FXSplitter.i
//%include FXStatusBar.i
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
//%include FXToolBarGrip.i
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
