/***********************************************************************
 * $Id: FXPy.cpp,v 1.37 2002/02/11 09:58:49 calvin Exp $
 ***********************************************************************/

#define FXAPI
#include "fxdefs2.h"
#include "fx.h"
#include "FXCURCursor.h"
#include "FXJPGImage.h"
#include "FXJPGIcon.h"
#include "FXPNGIcon.h"
#include "FXPNGImage.h"
#include "FXTIFIcon.h"
#include "FXTIFImage.h"
#include "FXRGBIcon.h"
#include "FXRGBImage.h"
#include "FXICOIcon.h"
#include "FXICOImage.h"
#include "fx3d.h"
#include "FXObject.h"
#include "FXComposeContext.h"
#include "FXGradientBar.h"
#include "FXMemMap.h"
#include "FXTranslator.h"

#include "Python.h"

#if 0 // BAA
#include "FXPyApp.h"
#endif // BAA

#include "FXPy.h"


#if 1 // BAA
// #include "impl.h"

using namespace FX;

namespace FX {

FXPy_IMPLEMENT(FXPyObject,FXObject,NULL,0)
FXPy_IMPLEMENT(FXPyId,FXObject,NULL,0)
FXPy_IMPLEMENT(FXPyMainWindow,FXMainWindow,NULL,0)
FXPy_IMPLEMENT(FXPy4Splitter,FX4Splitter,NULL,0)
FXPy_IMPLEMENT(FXPy7Segment,FX7Segment,NULL,0)
FXPy_IMPLEMENT(FXPyAccelTable,FXAccelTable,NULL,0)
FXPy_IMPLEMENT(FXPyArrowButton,FXArrowButton,NULL,0)
FXPy_IMPLEMENT(FXPyBMPIcon,FXBMPIcon,NULL,0)
FXPy_IMPLEMENT(FXPyBMPImage,FXBMPImage,NULL,0)
FXPy_IMPLEMENT(FXPyBitmap,FXBitmap,NULL,0)
FXPy_IMPLEMENT(FXPyBitmapFrame,FXBitmapFrame,NULL,0)
FXPy_IMPLEMENT(FXPyBitmapView,FXBitmapView,NULL,0)
FXPy_IMPLEMENT(FXPyButton,FXButton,NULL,0)
FXPy_IMPLEMENT(FXPyCursor,FXCursor,NULL,0)
FXPy_IMPLEMENT(FXPyCanvas,FXCanvas,NULL,0)
FXPy_IMPLEMENT(FXPyCheckButton,FXCheckButton,NULL,0)
FXPy_IMPLEMENT(FXPyChoiceBox,FXChoiceBox,NULL,0)
FXPy_IMPLEMENT(FXPyColorBar,FXColorBar,NULL,0)
FXPy_IMPLEMENT(FXPyColorDialog,FXColorDialog,NULL,0)
FXPy_IMPLEMENT(FXPyColorItem,FXColorItem,NULL,0)
FXPy_IMPLEMENT(FXPyColorList,FXColorList,NULL,0)
FXPy_IMPLEMENT(FXPyColorRing,FXColorRing,NULL,0)
FXPy_IMPLEMENT(FXPyColorSelector,FXColorSelector,NULL,0)
FXPy_IMPLEMENT(FXPyColorWell,FXColorWell,NULL,0)
FXPy_IMPLEMENT(FXPyColorWheel,FXColorWheel,NULL,0)
FXPy_IMPLEMENT(FXPyComboBox,FXComboBox,NULL,0)
FXPy_IMPLEMENT(FXPyComposeContext,FXComposeContext,NULL,0)
FXPy_IMPLEMENT(FXPyComposite,FXComposite,NULL,0)
FXPy_IMPLEMENT(FXPyDataTarget,FXDataTarget,NULL,0)
FXPy_IMPLEMENT(FXPyDelegator,FXDelegator,NULL,0)
FXPy_IMPLEMENT(FXPyDial,FXDial,NULL,0)
FXPy_IMPLEMENT(FXPyDialogBox,FXDialogBox,NULL,0)
FXPy_IMPLEMENT(FXPyDict,FXDict,NULL,0)
FXPy_IMPLEMENT(FXPyDirBox,FXDirBox,NULL,0)
FXPy_IMPLEMENT(FXPyDirDialog,FXDirDialog,NULL,0)
FXPy_IMPLEMENT(FXPyDirItem,FXDirItem,NULL,0)
FXPy_IMPLEMENT(FXPyDirList,FXDirList,NULL,0)
FXPy_IMPLEMENT(FXPyDirSelector,FXDirSelector,NULL,0)
FXPy_IMPLEMENT(FXPyDockBar,FXDockBar,NULL,0)
FXPy_IMPLEMENT(FXPyDockHandler,FXDockHandler,NULL,0)
FXPy_IMPLEMENT(FXPyDockSite,FXDockSite,NULL,0)
FXPy_IMPLEMENT(FXPyDockTitle,FXDockTitle,NULL,0)
FXPy_IMPLEMENT(FXPyDocument,FXDocument,NULL,0)
FXPy_IMPLEMENT(FXPyDragCorner,FXDragCorner,NULL,0)
FXPy_IMPLEMENT(FXPyDrawable,FXDrawable,NULL,0)
FXPy_IMPLEMENT(FXPyDriveBox,FXDriveBox,NULL,0)
FXPy_IMPLEMENT(FXPyFileDialog,FXFileDialog,NULL,0)
FXPy_IMPLEMENT(FXPyFileDict,FXFileDict,NULL,0)
FXPy_IMPLEMENT(FXPyFileItem,FXFileItem,NULL,0)
FXPy_IMPLEMENT(FXPyFileSelector,FXFileSelector,NULL,0)
FXPy_IMPLEMENT(FXPyFoldingItem,FXFoldingItem,NULL,0)
FXPy_IMPLEMENT(FXPyFoldingList,FXFoldingList,NULL,0)
FXPy_IMPLEMENT(FXPyFont,FXFont,NULL,0)
FXPy_IMPLEMENT(FXPyFontDialog,FXFontDialog,NULL,0)
FXPy_IMPLEMENT(FXPyFontSelector,FXFontSelector,NULL,0)
FXPy_IMPLEMENT(FXPyFrame,FXFrame,NULL,0)
FXPy_IMPLEMENT(FXPyGIFCursor,FXGIFCursor,NULL,0)
FXPy_IMPLEMENT(FXPyGIFIcon,FXGIFIcon,NULL,0)
FXPy_IMPLEMENT(FXPyGIFImage,FXGIFImage,NULL,0)
FXPy_IMPLEMENT(FXPyGUISignal,FXGUISignal,NULL,0)
FXPy_IMPLEMENT(FXPyGradientBar,FXGradientBar,NULL,0)
FXPy_IMPLEMENT(FXPyGroupBox,FXGroupBox,NULL,0)
FXPy_IMPLEMENT(FXPyHeaderItem,FXHeaderItem,NULL,0)
FXPy_IMPLEMENT(FXPyHeader,FXHeader,NULL,0)
FXPy_IMPLEMENT(FXPyHorizontalFrame,FXHorizontalFrame,NULL,0)
FXPy_IMPLEMENT(FXPyICOIcon,FXICOIcon,NULL,0)
FXPy_IMPLEMENT(FXPyICOImage,FXICOImage,NULL,0)
FXPy_IMPLEMENT(FXPyIFFIcon,FXIFFIcon,NULL,0)
FXPy_IMPLEMENT(FXPyIFFImage,FXIFFImage,NULL,0)
FXPy_IMPLEMENT(FXPyIcon,FXIcon,NULL,0)
FXPy_IMPLEMENT(FXPyIconDict,FXIconDict,NULL,0)
FXPy_IMPLEMENT(FXPyIconList,FXIconList,NULL,0)
FXPy_IMPLEMENT(FXPyIconItem,FXIconItem,NULL,0)
FXPy_IMPLEMENT(FXPyImage,FXImage,NULL,0)
FXPy_IMPLEMENT(FXPyImageFrame,FXImageFrame,NULL,0)
FXPy_IMPLEMENT(FXPyImageView,FXImageView,NULL,0)
FXPy_IMPLEMENT(FXPyInputDialog,FXInputDialog,NULL,0)
FXPy_IMPLEMENT(FXPyJPGIcon,FXJPGIcon,NULL,0)
FXPy_IMPLEMENT(FXPyJPGImage,FXJPGImage,NULL,0)
FXPy_IMPLEMENT(FXPyKnob,FXKnob,NULL,0)
FXPy_IMPLEMENT(FXPyLabel,FXLabel,NULL,0)
FXPy_IMPLEMENT(FXPyListBox,FXListBox,NULL,0)
FXPy_IMPLEMENT(FXPyListItem,FXListItem,NULL,0)
FXPy_IMPLEMENT(FXPyList,FXList,NULL,0)
FXPy_IMPLEMENT(FXPyMDIDeleteButton,FXMDIDeleteButton,NULL,0)
FXPy_IMPLEMENT(FXPyMDIRestoreButton,FXMDIRestoreButton,NULL,0)
FXPy_IMPLEMENT(FXPyMDIMaximizeButton,FXMDIMaximizeButton,NULL,0)
FXPy_IMPLEMENT(FXPyMDIMinimizeButton,FXMDIMinimizeButton,NULL,0)
FXPy_IMPLEMENT(FXPyMDIWindowButton,FXMDIWindowButton,NULL,0)
FXPy_IMPLEMENT(FXPyMDIMenu,FXMDIMenu,NULL,0)
FXPy_IMPLEMENT(FXPyMDIChild,FXMDIChild,NULL,0)
FXPy_IMPLEMENT(FXPyMDIClient,FXMDIClient,NULL,0)
FXPy_IMPLEMENT(FXPyMatrix,FXMatrix,NULL,0)
FXPy_IMPLEMENT(FXPyMenuBar,FXMenuBar,NULL,0)
FXPy_IMPLEMENT(FXPyMenuButton,FXMenuButton,NULL,0)
FXPy_IMPLEMENT(FXPyMenuCaption,FXMenuCaption,NULL,0)
FXPy_IMPLEMENT(FXPyMenuCascade,FXMenuCascade,NULL,0)
FXPy_IMPLEMENT(FXPyMenuCheck,FXMenuCheck,NULL,0)
FXPy_IMPLEMENT(FXPyMenuCommand,FXMenuCommand,NULL,0)
FXPy_IMPLEMENT(FXPyMenuPane,FXMenuPane,NULL,0)
FXPy_IMPLEMENT(FXPyMenuRadio,FXMenuRadio,NULL,0)
FXPy_IMPLEMENT(FXPyMenuSeparator,FXMenuSeparator,NULL,0)
FXPy_IMPLEMENT(FXPyMenuTitle,FXMenuTitle,NULL,0)
FXPy_IMPLEMENT(FXPyMessageBox,FXMessageBox,NULL,0)
FXPy_IMPLEMENT(FXPyOption,FXOption,NULL,0)
FXPy_IMPLEMENT(FXPyOptionMenu,FXOptionMenu,NULL,0)
FXPy_IMPLEMENT(FXPyPCXIcon,FXPCXIcon,NULL,0)
FXPy_IMPLEMENT(FXPyPCXImage,FXPCXImage,NULL,0)
FXPy_IMPLEMENT(FXPyPNGIcon,FXPNGIcon,NULL,0)
FXPy_IMPLEMENT(FXPyPNGImage,FXPNGImage,NULL,0)
FXPy_IMPLEMENT(FXPyPPMIcon,FXPPMIcon,NULL,0)
FXPy_IMPLEMENT(FXPyPPMImage,FXPPMImage,NULL,0)
FXPy_IMPLEMENT(FXPyPacker,FXPacker,NULL,0)
FXPy_IMPLEMENT(FXPyPicker,FXPicker,NULL,0)
FXPy_IMPLEMENT(FXPyPopup,FXPopup,NULL,0)
FXPy_IMPLEMENT(FXPyPrintDialog,FXPrintDialog,NULL,0)
FXPy_IMPLEMENT(FXPyProgressBar,FXProgressBar,NULL,0)
FXPy_IMPLEMENT(FXPyProgressDialog,FXProgressDialog,NULL,0)
FXPy_IMPLEMENT(FXPyRASIcon,FXRASIcon,NULL,0)
FXPy_IMPLEMENT(FXPyRASImage,FXRASImage,NULL,0)
FXPy_IMPLEMENT(FXPyRGBIcon,FXRGBIcon,NULL,0)
FXPy_IMPLEMENT(FXPyRGBImage,FXRGBImage,NULL,0)
FXPy_IMPLEMENT(FXPyRadioButton,FXRadioButton,NULL,0)
FXPy_IMPLEMENT(FXPyRealSlider,FXRealSlider,NULL,0)
FXPy_IMPLEMENT(FXPyRealSpinner,FXRealSpinner,NULL,0)
FXPy_IMPLEMENT(FXPyRecentFiles,FXRecentFiles,NULL,0)
FXPy_IMPLEMENT(FXPyRegistry,FXRegistry,NULL,0)
FXPy_IMPLEMENT(FXPyReplaceDialog,FXReplaceDialog,NULL,0)
FXPy_IMPLEMENT(FXPyRootWindow,FXRootWindow,NULL,0)
FXPy_IMPLEMENT(FXPyRuler,FXRuler,NULL,0)
FXPy_IMPLEMENT(FXPyRulerView,FXRulerView,NULL,0)
FXPy_IMPLEMENT(FXPyScrollArea,FXScrollArea,NULL,0)
FXPy_IMPLEMENT(FXPyScrollBar,FXScrollBar,NULL,0)
FXPy_IMPLEMENT(FXPyScrollCorner,FXScrollCorner,NULL,0)
FXPy_IMPLEMENT(FXPyScrollPane,FXScrollPane,NULL,0)
FXPy_IMPLEMENT(FXPyScrollWindow,FXScrollWindow,NULL,0)
FXPy_IMPLEMENT(FXPySearchDialog,FXSearchDialog,NULL,0)
FXPy_IMPLEMENT(FXPySeparator,FXSeparator,NULL,0)
FXPy_IMPLEMENT(FXPyHorizontalSeparator,FXHorizontalSeparator,NULL,0)
FXPy_IMPLEMENT(FXPyVerticalSeparator,FXVerticalSeparator,NULL,0)
FXPy_IMPLEMENT(FXPySettings,FXSettings,NULL,0)
FXPy_IMPLEMENT(FXPyShell,FXShell,NULL,0)
FXPy_IMPLEMENT(FXPyShutterItem,FXShutterItem,NULL,0)
FXPy_IMPLEMENT(FXPyShutter,FXShutter,NULL,0)
FXPy_IMPLEMENT(FXPySlider,FXSlider,NULL,0)
FXPy_IMPLEMENT(FXPySpinner,FXSpinner,NULL,0)
FXPy_IMPLEMENT(FXPySplashWindow,FXSplashWindow,NULL,0)
FXPy_IMPLEMENT(FXPySplitter,FXSplitter,NULL,0)
FXPy_IMPLEMENT(FXPySpring,FXSpring,NULL,0)
FXPy_IMPLEMENT(FXPyStatusBar,FXStatusBar,NULL,0)
FXPy_IMPLEMENT(FXPyStatusLine,FXStatusLine,NULL,0)
FXPy_IMPLEMENT(FXPyStringDict,FXStringDict,NULL,0)
FXPy_IMPLEMENT(FXPySwitcher,FXSwitcher,NULL,0)
FXPy_IMPLEMENT(FXPyTGAIcon,FXTGAIcon,NULL,0)
FXPy_IMPLEMENT(FXPyTGAImage,FXTGAImage,NULL,0)
FXPy_IMPLEMENT(FXPyTIFIcon,FXTIFIcon,NULL,0)
FXPy_IMPLEMENT(FXPyTIFImage,FXTIFImage,NULL,0)
FXPy_IMPLEMENT(FXPyTabBar,FXTabBar,NULL,0)
FXPy_IMPLEMENT(FXPyTabBook,FXTabBook,NULL,0)
FXPy_IMPLEMENT(FXPyTabItem,FXTabItem,NULL,0)
FXPy_IMPLEMENT(FXPyTableItem,FXTableItem,NULL,0)
FXPy_IMPLEMENT(FXPyComboTableItem,FXComboTableItem,NULL,0)
FXPy_IMPLEMENT(FXPyTable,FXTable,NULL,0)
FXPy_IMPLEMENT(FXPyText,FXText,NULL,0)
FXPy_IMPLEMENT(FXPyTextField,FXTextField,NULL,0)
FXPy_IMPLEMENT(FXPyToggleButton,FXToggleButton,NULL,0)
FXPy_IMPLEMENT(FXPyToolBar,FXToolBar,NULL,0)
FXPy_IMPLEMENT(FXPyToolBarGrip,FXToolBarGrip,NULL,0)
FXPy_IMPLEMENT(FXPyToolBarShell,FXToolBarShell,NULL,0)
FXPy_IMPLEMENT(FXPyToolBarTab,FXToolBarTab,NULL,0)
FXPy_IMPLEMENT(FXPyToolTip,FXToolTip,NULL,0)
FXPy_IMPLEMENT(FXPyTopWindow,FXTopWindow,NULL,0)
FXPy_IMPLEMENT(FXPyTranslator,FXTranslator,NULL,0)
FXPy_IMPLEMENT(FXPyTreeItem,FXTreeItem,NULL,0)
FXPy_IMPLEMENT(FXPyTreeList,FXTreeList,NULL,0)
FXPy_IMPLEMENT(FXPyTreeListBox,FXTreeListBox,NULL,0)
FXPy_IMPLEMENT(FXPyTriStateButton,FXTriStateButton,NULL,0)
FXPy_IMPLEMENT(FXPyVerticalFrame,FXVerticalFrame,NULL,0)
FXPy_IMPLEMENT(FXPyVisual,FXVisual,NULL,0)
FXPy_IMPLEMENT(FXPyWindow,FXWindow,NULL,0)
FXPy_IMPLEMENT(FXPyWizard,FXWizard,NULL,0)
FXPy_IMPLEMENT(FXPyXBMIcon,FXXBMIcon,NULL,0)
FXPy_IMPLEMENT(FXPyXBMImage,FXXBMImage,NULL,0)
FXPy_IMPLEMENT(FXPyXPMIcon,FXXPMIcon,NULL,0)
FXPy_IMPLEMENT(FXPyXPMImage,FXXPMImage,NULL,0)
FXPy_IMPLEMENT(FXPyCommandGroup,FXCommandGroup,NULL,0)
FXPy_IMPLEMENT(FXPyUndoList,FXUndoList,NULL,0)
FXPy_IMPLEMENT(FXPyCURCursor,FXCURCursor,NULL,0)

FXPyObject::FXPyObject(){}

FXPyMainWindow::FXPyMainWindow(FXApp* a,const FXString& name,FXIcon *ic,FXIcon *mi,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs):
  FXMainWindow(a,name,ic,mi,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){
  }

// Destroy
FXPyMainWindow::~FXPyMainWindow(){
  }

FXPy4Splitter::FXPy4Splitter(FX::FXComposite* p,FX::FXuint opts,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h): FX4Splitter(p,opts,x,y,w,h){}

FXPy4Splitter::FXPy4Splitter(FX::FXComposite* p,FX::FXObject* tgt,FX::FXSelector sel,FX::FXuint opts,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h):FX4Splitter(p,tgt,sel,opts,x,y,w,h){}

FXPy7Segment::FXPy7Segment(FX::FXComposite* p,const FX::FXString& text,FX::FXuint opts,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint pl,FX::FXint pr,FX::FXint pt,FX::FXint pb):FX7Segment(p,text,opts,x,y,w,h,pl,pr,pt,pb){}

FXPyAccelTable::FXPyAccelTable():FXAccelTable(){}

FXPyArrowButton::FXPyArrowButton(FX::FXComposite* p,FX::FXObject* tgt,FX::FXSelector sel,FX::FXuint opts,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint pl,FX::FXint pr,FX::FXint pt,FX::FXint pb) : FXArrowButton(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}

FXPyBMPIcon::FXPyBMPIcon(FX::FXApp* a,const void *pix,FX::FXColor clr,FX::FXuint opts,FX::FXint w,FX::FXint h) : FXBMPIcon(a,pix,clr,opts,w,h){}

FXPyBMPImage::FXPyBMPImage(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXBMPImage(a,pix,opts,w,h){}

FXPyBitmap::FXPyBitmap(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXBitmap(a,pix,opts,w,h){}

FXPyBitmapFrame::FXPyBitmapFrame(FXComposite* p,FXBitmap *bmp,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXBitmapFrame(p,bmp,opts,x,y,w,h,pl,pr,pt,pb){}

FXPyBitmapView::FXPyBitmapView(FXComposite* p,FXBitmap *bmp,FXObject* tgt,FXSelector sel, FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXBitmapView(p,bmp,tgt,sel,opts,x,y,w,h){}

FXPyButton::FXPyButton(FXComposite* p,const FXString& text,FXIcon* ic,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXButton(p,text,ic,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}

FXPyCursor::FXPyCursor(FXApp* a,FXStockCursor curid) : FXCursor(a,curid){}
FXPyCursor::FXPyCursor(FXApp* a,const FXuchar* src,const FXuchar* msk,FXint w,FXint h,FXint hx,FXint hy) : FXCursor(a,src,msk,w,h,hx,hy){}
FXPyCursor::FXPyCursor(FXApp* a,const FXColor* pix,FXint w,FXint h,FXint hx,FXint hy) : FXCursor(a,pix,w,h,hx,hy){}

FXPyCanvas::FXPyCanvas(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXCanvas(p,tgt,sel,opts,x,y,w,h){}

FXPyCheckButton::FXPyCheckButton(FXComposite* p,const FXString& text,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXCheckButton(p,text,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}

FXPyChoiceBox::FXPyChoiceBox(FXWindow* owner,const FXString& caption,const FXString& text,FXIcon* icon,const FXchar** choices,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXChoiceBox(owner,caption,text,icon,choices,opts,x,y,w,h){}

FXPyChoiceBox::FXPyChoiceBox(FXWindow* owner,const FXString& caption,const FXString& text,FXIcon* icon,const FXString& choices,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXChoiceBox(owner,caption,text,icon,choices,opts,x,y,w,h){}

FXPyChoiceBox::FXPyChoiceBox(FXApp* app,const FXString& caption,const FXString& text,FXIcon* icon,const FXchar** choices,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXChoiceBox(app,caption,text,icon,choices,opts,x,y,w,h){}

FXPyChoiceBox::FXPyChoiceBox(FXApp* app,const FXString& caption,const FXString& text,FXIcon* icon,const FXString& choices,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXChoiceBox(app,caption,text,icon,choices,opts,x,y,w,h){}

FXPyColorBar::FXPyColorBar(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXColorBar(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}

FXPyColorDialog::FXPyColorDialog(FXWindow* owner,const FXString& name,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXColorDialog(owner,name,opts,x,y,w,h){}

FXPyColorItem::FXPyColorItem(const FX::FXString& text,FX::FXColor clr,void* ptr) : FXColorItem(text,clr,ptr){}

FXPyColorList::FXPyColorList(FX::FXComposite *p,FX::FXObject* tgt,FX::FXSelector sel,FX::FXuint opts,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h) : FXColorList(p,tgt,sel,opts,x,y,w,h){}

FXPyColorRing::FXPyColorRing(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXColorRing(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}

FXPyColorSelector::FXPyColorSelector(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXColorSelector(p,tgt,sel,opts,x,y,w,h){}

FXPyColorWell::FXPyColorWell(FXComposite* p,FXColor clr,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXColorWell(p,clr,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}

FXPyColorWheel::FXPyColorWheel(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXColorWheel(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}

FXPyComboBox::FXPyComboBox(FXComposite *p,FXint cols,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXComboBox(p,cols,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyComposeContext::FXPyComposeContext(FXApp* a,FXWindow* win,FXSelector sel) : FXComposeContext(a,win,sel){}
    FXPyComposeContext::FXPyComposeContext() : FXComposeContext(){}
    FXPyComposite::FXPyComposite(FX::FXPyComposite* p,FX::FXuint opts,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h) : FXComposite(p,opts,x,y,w,h){}
    FXPyComposite::FXPyComposite() : FXComposite(){}
    FXPyDataTarget::FXPyDataTarget() : FXDataTarget(){}
    FXPyDelegator::FXPyDelegator(FXObject* target) : FXDelegator(target){}
    FXPyDelegator::FXPyDelegator() : FXDelegator(){}
    FXPyDial::FXPyDial(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXDial(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyDial::FXPyDial() : FXDial(){}
    FXPyDialogBox::FXPyDialogBox(FXApp* a,const FXString& name,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXDialogBox(a,name,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyDialogBox::FXPyDialogBox(FXWindow* owner,const FXString& name,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXDialogBox(owner,name,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyDialogBox::FXPyDialogBox() : FXDialogBox(){}
    FXPyDict::FXPyDict() : FXDict(){}
    FXPyDirBox::FXPyDirBox(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXDirBox(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyDirBox::FXPyDirBox() : FXDirBox(){}
    FXPyDirDialog::FXPyDirDialog(FXWindow* owner,const FXString& name,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXDirDialog(owner,name,opts,x,y,w,h){}
    FXPyDirDialog::FXPyDirDialog(FXApp* a,const FXString& name,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXDirDialog(a,name,opts,x,y,w,h){}
    FXPyDirDialog::FXPyDirDialog() : FXDirDialog(){}
    FXPyDirItem::FXPyDirItem(const FXString& text,FXIcon* oi,FXIcon* ci,void* ptr) : FXDirItem(text,oi,ci,ptr){}
    FXPyDirItem::FXPyDirItem() : FXDirItem(){}
    FXPyDirList::FXPyDirList(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXDirList(p,tgt,sel,opts,x,y,w,h){}
    FXPyDirList::FXPyDirList() : FXDirList(){}
    FXPyDirSelector::FXPyDirSelector(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXDirSelector(p,tgt,sel,opts,x,y,w,h){}
    FXPyDirSelector::FXPyDirSelector() : FXDirSelector(){}
    FXPyDockBar::FXPyDockBar(FXComposite* p,FXComposite* q,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXDockBar(p,q,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyDockBar::FXPyDockBar(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXDockBar(p,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyDockBar::FXPyDockBar() : FXDockBar(){}
    FXPyDockHandler::FXPyDockHandler(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXDockHandler(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyDockHandler::FXPyDockHandler() : FXDockHandler(){}
    FXPyDockSite::FXPyDockSite(FXComposite *p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXDockSite(p,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyDockSite::FXPyDockSite() : FXDockSite(){}
    FXPyDockTitle::FXPyDockTitle(FXComposite* p,const FXString& text,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXDockTitle(p,text,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyDockTitle::FXPyDockTitle() : FXDockTitle(){}
    FXPyDocument::FXPyDocument() : FXDocument(){}
    FXPyDragCorner::FXPyDragCorner(FXComposite* p) : FXDragCorner(p){}
    FXPyDragCorner::FXPyDragCorner() : FXDragCorner(){}
    FXPyDrawable::FXPyDrawable() : FXDrawable(){}
    FXPyDrawable::FXPyDrawable(FXApp* a,FXint w,FXint h) : FXDrawable(a,w,h){}
    FXPyDriveBox::FXPyDriveBox(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXDriveBox(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyDriveBox::FXPyDriveBox() : FXDriveBox(){}
    FXPyFileDialog::FXPyFileDialog(FXWindow* owner,const FXString& name,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXFileDialog(owner,name,opts,x,y,w,h){}
    FXPyFileDialog::FXPyFileDialog(FXApp* a,const FXString& name,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXFileDialog(a,name,opts,x,y,w,h){}
    FXPyFileDialog::FXPyFileDialog() : FXFileDialog(){}
    FXPyFileDict::FXPyFileDict(FXApp* app) : FXFileDict(app){}
    FXPyFileDict::FXPyFileDict(FXApp* app,FXSettings* db) : FXFileDict(app,db){}
    FXPyFileDict::FXPyFileDict() : FXFileDict(){}
    FXPyFileItem::FXPyFileItem(const FXString& text,FXIcon* bi,FXIcon* mi,void* ptr) : FXFileItem(text,bi,mi,ptr){}
    FXPyFileItem::FXPyFileItem() : FXFileItem(){}
    FXPyFileSelector::FXPyFileSelector(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXFileSelector(p,tgt,sel,opts,x,y,w,h){}
    FXPyFileSelector::FXPyFileSelector() : FXFileSelector(){}
    FXPyFoldingItem::FXPyFoldingItem(const FXString& text,FXIcon* oi,FXIcon* ci,void* ptr) : FXFoldingItem(text,oi,ci,ptr){}
    FXPyFoldingItem::FXPyFoldingItem() : FXFoldingItem(){}
    FXPyFoldingList::FXPyFoldingList(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXFoldingList(p,tgt,sel,opts,x,y,w,h){}
    FXPyFoldingList::FXPyFoldingList() : FXFoldingList(){}
    FXPyFont::FXPyFont() : FXFont(){}
    FXPyFont::FXPyFont(FXApp* a,const FXString& fontstring) : FXFont(a,fontstring){}
    FXPyFontDialog::FXPyFontDialog(FXWindow* owner,const FXString& name,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXFontDialog(owner,name,opts,x,y,w,h){}
    FXPyFontDialog::FXPyFontDialog() : FXFontDialog(){}
    FXPyFontSelector::FXPyFontSelector(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXFontSelector(p,tgt,sel,opts,x,y,w,h){}
    FXPyFontSelector::FXPyFontSelector() : FXFontSelector(){}
    FXPyFrame::FXPyFrame(FX::FXComposite* p,FX::FXuint opts,FX::FXint x,FX::FXint y,FX::FXint w,FX::FXint h,FX::FXint pl,FX::FXint pr,FX::FXint pt,FX::FXint pb) : FXFrame(p,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyFrame::FXPyFrame() : FXFrame(){}
    FXPyGIFCursor::FXPyGIFCursor(FXApp* a,const void* pix,FXint hx,FXint hy) : FXGIFCursor(a,pix,hx,hy){}
    FXPyGIFCursor::FXPyGIFCursor() : FXGIFCursor(){}
    FXPyGIFIcon::FXPyGIFIcon(FX::FXApp* a,const void *pix,FX::FXColor clr,FX::FXuint opts,FX::FXint w,FX::FXint h) : FXGIFIcon(a,pix,clr,opts,w,h){}
    FXPyGIFIcon::FXPyGIFIcon() : FXGIFIcon(){}
    FXPyGIFImage::FXPyGIFImage(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXGIFImage(a,pix,opts,w,h){}
    FXPyGIFImage::FXPyGIFImage() : FXGIFImage(){}
    FXPyGUISignal::FXPyGUISignal(FXApp* a,FXObject* tgt,FXSelector sel,void* ptr) : FXGUISignal(a,tgt,sel,ptr){}
    FXPyGUISignal::FXPyGUISignal() : FXGUISignal(){}
    FXPyGradientBar::FXPyGradientBar(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXGradientBar(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyGradientBar::FXPyGradientBar() : FXGradientBar(){}
    FXPyGroupBox::FXPyGroupBox(FXComposite* p,const FXString& text,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXGroupBox(p,text,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyGroupBox::FXPyGroupBox() : FXGroupBox(){}
    FXPyHeaderItem::FXPyHeaderItem(const FXString& text,FXIcon* ic,FXint s,void* ptr) : FXHeaderItem(text,ic,s,ptr){}
    FXPyHeaderItem::FXPyHeaderItem() : FXHeaderItem(){}
    FXPyHeader::FXPyHeader(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXHeader(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyHeader::FXPyHeader() : FXHeader(){}
    FXPyHorizontalFrame::FXPyHorizontalFrame(FXComposite *p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXHorizontalFrame(p,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyHorizontalFrame::FXPyHorizontalFrame() : FXHorizontalFrame(){}
    FXPyICOIcon::FXPyICOIcon(FXApp* a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXICOIcon(a,pix,clr,opts,w,h){}
    FXPyICOIcon::FXPyICOIcon() : FXICOIcon(){}
    FXPyICOImage::FXPyICOImage(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXICOImage(a,pix,opts,w,h){}
    FXPyICOImage::FXPyICOImage() : FXICOImage(){}
    FXPyId::FXPyId() : FXId(){}
    FXPyIFFIcon::FXPyIFFIcon(FXApp* a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXIFFIcon(a,pix,clr,opts,w,h){}
    FXPyIFFIcon::FXPyIFFIcon() : FXIFFIcon(){}
    FXPyIFFImage::FXPyIFFImage(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXIFFImage(a,pix,opts,w,h){}
    FXPyIFFImage::FXPyIFFImage() : FXIFFImage(){}
    FXPyIcon::FXPyIcon(FXApp* a,const FXColor *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXIcon(a,pix,clr,opts,w,h){}
    FXPyIcon::FXPyIcon() : FXIcon(){}
    FXPyIconDict::FXPyIconDict(FXApp* app,const FXString& pnPath) : FXIconDict(app,pnPath){}
    FXPyIconDict::FXPyIconDict() : FXIconDict(){}
    FXPyIconList::FXPyIconList(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXIconList(p,tgt,sel,opts,x,y,w,h){}
    FXPyIconList::FXPyIconList() : FXIconList(){}
    FXPyIconItem::FXPyIconItem(const FXString& text,FXIcon* bi,FXIcon* mi,void* ptr) : FXIconItem(text,bi,mi,ptr){}
    FXPyIconItem::FXPyIconItem() : FXIconItem(){}
    FXPyImage::FXPyImage(FXApp* a,const FXColor *pix,FXuint opts,FXint w,FXint h) : FXImage(a,pix,opts,w,h){}
    FXPyImage::FXPyImage() : FXImage(){}
    FXPyImageFrame::FXPyImageFrame(FXComposite* p,FXImage *img,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXImageFrame(p,img,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyImageFrame::FXPyImageFrame() : FXImageFrame(){}
    FXPyImageView::FXPyImageView(FXComposite* p,FXImage* img,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXImageView(p,img,tgt,sel,opts,x,y,w,h){}
    FXPyImageView::FXPyImageView() : FXImageView(){}
    FXPyInputDialog::FXPyInputDialog(FXWindow* owner,const FXString& caption,const FXString& label,FXIcon* icon,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXInputDialog(owner,caption,label,icon,opts,x,y,w,h){}
    FXPyInputDialog::FXPyInputDialog() : FXInputDialog(){}
    FXPyInputDialog::FXPyInputDialog(FXApp* app,const FXString& caption,const FXString& label,FXIcon* icon,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXInputDialog(app,caption,label,icon,opts,x,y,w,h){}
    FXPyJPGIcon::FXPyJPGIcon(FXApp *a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h,FXint q) : FXJPGIcon(a,pix,clr,opts,w,h,q){}
    FXPyJPGIcon::FXPyJPGIcon() : FXJPGIcon(){}
    FXPyJPGImage::FXPyJPGImage(FXApp *a,const void *pix,FXuint opts,FXint w,FXint h,FXint q) : FXJPGImage(a,pix,opts,w,h,q){}
    FXPyJPGImage::FXPyJPGImage() : FXJPGImage(){}
    FXPyKnob::FXPyKnob(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXKnob(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyKnob::FXPyKnob() : FXKnob(){}
    FXPyLabel::FXPyLabel(FXComposite* p,const FXString& text,FXIcon* ic,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXLabel(p,text,ic,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyLabel::FXPyLabel() : FXLabel(){}
    FXPyListBox::FXPyListBox(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXListBox(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyListBox::FXPyListBox() : FXListBox(){}
    FXPyListItem::FXPyListItem(const FXString& text,FXIcon* ic,void* ptr) : FXListItem(text,ic,ptr){}
    FXPyListItem::FXPyListItem() : FXListItem(){}
    FXPyList::FXPyList(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXList(p,tgt,sel,opts,x,y,w,h){}
    FXPyList::FXPyList() : FXList(){}
    FXPyMDIDeleteButton::FXPyMDIDeleteButton(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXMDIDeleteButton(p,tgt,sel,opts,x,y,w,h){}
    FXPyMDIDeleteButton::FXPyMDIDeleteButton() : FXMDIDeleteButton(){}
    FXPyMDIRestoreButton::FXPyMDIRestoreButton(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXMDIRestoreButton(p,tgt,sel,opts,x,y,w,h){}
    FXPyMDIRestoreButton::FXPyMDIRestoreButton() : FXMDIRestoreButton(){}
    FXPyMDIMaximizeButton::FXPyMDIMaximizeButton(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXMDIMaximizeButton(p,tgt,sel,opts,x,y,w,h){}
    FXPyMDIMaximizeButton::FXPyMDIMaximizeButton() : FXMDIMaximizeButton(){}
    FXPyMDIMinimizeButton::FXPyMDIMinimizeButton(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXMDIMinimizeButton(p,tgt,sel,opts,x,y,w,h){}
    FXPyMDIMinimizeButton::FXPyMDIMinimizeButton() : FXMDIMinimizeButton(){}
    FXPyMDIWindowButton::FXPyMDIWindowButton(FXComposite* p,FXPopup* pup,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXMDIWindowButton(p,pup,tgt,sel,opts,x,y,w,h){}
    FXPyMDIWindowButton::FXPyMDIWindowButton() : FXMDIWindowButton(){}
    FXPyMDIMenu::FXPyMDIMenu(FXWindow *owner,FXObject* tgt) : FXMDIMenu(owner,tgt){}
    FXPyMDIMenu::FXPyMDIMenu() : FXMDIMenu(){}
    FXPyMDIChild::FXPyMDIChild(FXMDIClient* p,const FXString& name,FXIcon* ic,FXPopup* pup,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXMDIChild(p,name,ic,pup,opts,x,y,w,h){}
    FXPyMDIChild::FXPyMDIChild() : FXMDIChild(){}
    FXPyMDIClient::FXPyMDIClient(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXMDIClient(p,opts,x,y,w,h){}
    FXPyMDIClient::FXPyMDIClient() : FXMDIClient(){}
    FXPyMatrix::FXPyMatrix(FXComposite *p,FXint n,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXMatrix(p,n,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyMatrix::FXPyMatrix() : FXMatrix(){}
    FXPyMenuBar::FXPyMenuBar(FXComposite* p,FXComposite* q,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXMenuBar(p,q,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyMenuBar::FXPyMenuBar(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXMenuBar(p,opts,x,y,w,h,pl,pr,pt,pb){}
FXPyMenuBar::FXPyMenuBar() : FXMenuBar(){}
    FXPyMenuButton::FXPyMenuButton(FXComposite* p,const FXString& text,FXIcon* ic,FXPopup* pup,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXMenuButton(p,text,ic,pup,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyMenuButton::FXPyMenuButton() : FXMenuButton(){}
    FXPyMenuCaption::FXPyMenuCaption(FXComposite* p,const FXString& text,FXIcon* ic,FXuint opts) : FXMenuCaption(p,text,ic,opts){}
    FXPyMenuCaption::FXPyMenuCaption() : FXMenuCaption(){}
    FXPyMenuCascade::FXPyMenuCascade(FXComposite* p,const FXString& text,FXIcon* ic,FXPopup* pup,FXuint opts) : FXMenuCascade(p,text,ic,pup,opts){}
    FXPyMenuCascade::FXPyMenuCascade() : FXMenuCascade(){}
    FXPyMenuCheck::FXPyMenuCheck(FXComposite* p,const FXString& text,FXObject* tgt,FXSelector sel,FXuint opts) : FXMenuCheck(p,text,tgt,sel,opts){}
    FXPyMenuCheck::FXPyMenuCheck() : FXMenuCheck(){}
    FXPyMenuCommand::FXPyMenuCommand(FXComposite* p,const FXString& text,FXIcon* ic,FXObject* tgt,FXSelector sel,FXuint opts) : FXMenuCommand(p,text,ic,tgt,sel,opts){}
    FXPyMenuCommand::FXPyMenuCommand() : FXMenuCommand(){}
    FXPyMenuPane::FXPyMenuPane(FXWindow* owner,FXuint opts) : FXMenuPane(owner,opts){}
    FXPyMenuPane::FXPyMenuPane() : FXMenuPane(){}
    FXPyMenuRadio::FXPyMenuRadio(FXComposite* p,const FXString& text,FXObject* tgt,FXSelector sel,FXuint opts) : FXMenuRadio(p,text,tgt,sel,opts){}
    FXPyMenuRadio::FXPyMenuRadio() : FXMenuRadio(){}
    FXPyMenuSeparator::FXPyMenuSeparator(FXComposite* p,FXuint opts) : FXMenuSeparator(p,opts){}
    FXPyMenuSeparator::FXPyMenuSeparator() : FXMenuSeparator(){}
    FXPyMenuTitle::FXPyMenuTitle(FXComposite* p,const FXString& text,FXIcon* ic,FXPopup* pup,FXuint opts) : FXMenuTitle(p,text,ic,pup,opts){}
    FXPyMenuTitle::FXPyMenuTitle() : FXMenuTitle(){}
    FXPyMessageBox::FXPyMessageBox(FXWindow* owner,const FXString& caption,const FXString& text,FXIcon* ic,FXuint opts,FXint x,FXint y) : FXMessageBox(owner,caption,text,ic,opts,x,y){}
    FXPyMessageBox::FXPyMessageBox() : FXMessageBox(){}
    FXPyMessageBox::FXPyMessageBox(FXApp* app,const FXString& caption,const FXString& text,FXIcon* ic,FXuint opts,FXint x,FXint y) : FXMessageBox(app,caption,text,ic,opts,x,y){}
    FXPyOption::FXPyOption(FXComposite* p,const FXString& text,FXIcon* ic,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXOption(p,text,ic,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyOption::FXPyOption() : FXOption(){}
    FXPyOptionMenu::FXPyOptionMenu(FXComposite* p,FXPopup* pup,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXOptionMenu(p,pup,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyOptionMenu::FXPyOptionMenu() : FXOptionMenu(){}
    FXPyPCXIcon::FXPyPCXIcon(FXApp* a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXPCXIcon(a,pix,clr,opts,w,h){}
    FXPyPCXIcon::FXPyPCXIcon() : FXPCXIcon(){}
    FXPyPCXImage::FXPyPCXImage(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXPCXImage(a,pix,opts,w,h){}
    FXPyPCXImage::FXPyPCXImage() : FXPCXImage(){}
    FXPyPNGIcon::FXPyPNGIcon(FXApp *a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXPNGIcon(a,pix,clr,opts,w,h){}
    FXPyPNGIcon::FXPyPNGIcon() : FXPNGIcon(){}
    FXPyPNGImage::FXPyPNGImage(FXApp *a,const void *pix,FXuint opts,FXint w,FXint h) : FXPNGImage(a,pix,opts,w,h){}
    FXPyPNGImage::FXPyPNGImage() : FXPNGImage(){}
    FXPyPPMIcon::FXPyPPMIcon(FXApp* a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXPPMIcon(a,pix,clr,opts,w,h){}
    FXPyPPMIcon::FXPyPPMIcon() : FXPPMIcon(){}
    FXPyPPMImage::FXPyPPMImage(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXPPMImage(a,pix,opts,w,h){}
    FXPyPPMImage::FXPyPPMImage() : FXPPMImage(){}
    FXPyPacker::FXPyPacker(FXComposite *p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXPacker(p,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyPacker::FXPyPacker() : FXPacker(){}
    FXPyPicker::FXPyPicker(FXComposite* p,const FXString& text,FXIcon* ic,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXPicker(p,text,ic,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyPicker::FXPyPicker() : FXPicker(){}

    FXPyPopup::FXPyPopup(FXWindow* owner,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXPopup(owner,opts,x,y,w,h){}
    FXPyPopup::FXPyPopup() : FXPopup(){}
    FXPyPrintDialog::FXPyPrintDialog(FXWindow* owner,const FXString& name,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXPrintDialog(owner,name,opts,x,y,w,h){}
    FXPyPrintDialog::FXPyPrintDialog() : FXPrintDialog(){}
    FXPyProgressBar::FXPyProgressBar(FXComposite* p,FXObject* target,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXProgressBar(p,target,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyProgressBar::FXPyProgressBar() : FXProgressBar(){}
    FXPyProgressDialog::FXPyProgressDialog(FXWindow* owner,const FXString& caption,const FXString& label,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXProgressDialog(owner,caption,label,opts,x,y,w,h){}
    FXPyProgressDialog::FXPyProgressDialog() : FXProgressDialog(){}

    FXPyRASIcon::FXPyRASIcon(FXApp* a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXRASIcon(a,pix,clr,opts,w,h){}
    FXPyRASIcon::FXPyRASIcon() : FXRASIcon(){}
    FXPyRASImage::FXPyRASImage(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXRASImage(a,pix,opts,w,h){}
    FXPyRASImage::FXPyRASImage() : FXRASImage(){}
    FXPyRGBIcon::FXPyRGBIcon(FXApp* a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXRGBIcon(a,pix,clr,opts,w,h){}
    FXPyRGBIcon::FXPyRGBIcon() : FXRGBIcon(){}
    FXPyRGBImage::FXPyRGBImage(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXRGBImage(a,pix,opts,w,h){}
    FXPyRGBImage::FXPyRGBImage() : FXRGBImage(){}
    FXPyRadioButton::FXPyRadioButton(FXComposite* p,const FXString& text,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXRadioButton(p,text,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyRadioButton::FXPyRadioButton() : FXRadioButton(){}
    FXPyRealSlider::FXPyRealSlider(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXRealSlider(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyRealSlider::FXPyRealSlider() : FXRealSlider(){}
    FXPyRealSpinner::FXPyRealSpinner(FXComposite *p,FXint cols,FXObject *tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXRealSpinner(p,cols,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyRealSpinner::FXPyRealSpinner() : FXRealSpinner(){}
    FXPyRecentFiles::FXPyRecentFiles() : FXRecentFiles(){}
    FXPyRecentFiles::FXPyRecentFiles(FXApp* a) : FXRecentFiles(a){}
    FXPyRecentFiles::FXPyRecentFiles(FXApp* a,const FXString& gp,FXObject *tgt,FXSelector sel) : FXRecentFiles(a,gp,tgt,sel){}

    FXPyRegistry::FXPyRegistry(const FXString& akey,const FXString& vkey) : FXRegistry(akey, vkey){}
    FXPyRegistry::FXPyRegistry() : FXRegistry(){}

    FXPyReplaceDialog::FXPyReplaceDialog(FXWindow* owner,const FXString& caption,FXIcon* ic,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXReplaceDialog(owner,caption,ic,opts,x,y,w,h){}
    FXPyReplaceDialog::FXPyReplaceDialog() : FXReplaceDialog(){}

    FXPyRootWindow::FXPyRootWindow(FXApp* a,FXVisual *vis) : FXRootWindow(a,vis){}
    FXPyRootWindow::FXPyRootWindow() : FXRootWindow(){}
    FXPyRuler::FXPyRuler(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXRuler(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyRuler::FXPyRuler() : FXRuler(){}
    FXPyRulerView::FXPyRulerView(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXRulerView(p,tgt,sel,opts,x,y,w,h){}
    FXPyRulerView::FXPyRulerView() : FXRulerView(){}
    FXPyScrollArea::FXPyScrollArea() : FXScrollArea(){}
    FXPyScrollBar::FXPyScrollBar(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXScrollBar(p,tgt,sel,opts,x,y,w,h){}
    FXPyScrollBar::FXPyScrollBar() : FXScrollBar(){}
    FXPyScrollCorner::FXPyScrollCorner(FXComposite* p) : FXScrollCorner(p){}
    FXPyScrollCorner::FXPyScrollCorner() : FXScrollCorner(){}
    FXPyScrollPane::FXPyScrollPane(FXWindow* owner,FXint nvis,FXuint opts) : FXScrollPane(owner,nvis,opts){}
    FXPyScrollPane::FXPyScrollPane() : FXScrollPane(){}
    FXPyScrollWindow::FXPyScrollWindow(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXScrollWindow(p,opts,x,y,w,h){}
    FXPyScrollWindow::FXPyScrollWindow() : FXScrollWindow(){}
    FXPySearchDialog::FXPySearchDialog(FXWindow* owner,const FXString& caption,FXIcon* ic,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXSearchDialog(owner,caption,ic,opts,x,y,w,h){}
    FXPySearchDialog::FXPySearchDialog() : FXSearchDialog(){}
    FXPySeparator::FXPySeparator(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXSeparator(p,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPySeparator::FXPySeparator() : FXSeparator(){}
    FXPyHorizontalSeparator::FXPyHorizontalSeparator(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXHorizontalSeparator(p,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyHorizontalSeparator::FXPyHorizontalSeparator() : FXHorizontalSeparator(){}
    FXPyVerticalSeparator::FXPyVerticalSeparator(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXVerticalSeparator(p,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyVerticalSeparator::FXPyVerticalSeparator() : FXVerticalSeparator(){}
    FXPySettings::FXPySettings() : FXSettings(){}
    FXPyShell::FXPyShell() : FXShell(){}
    FXPyShutterItem::FXPyShutterItem(FXShutter *p,const FXString& text,FXIcon* icon,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXShutterItem(p,text,icon,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyShutterItem::FXPyShutterItem() : FXShutterItem(){}
    FXPyShutter::FXPyShutter(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXShutter(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyShutter::FXPyShutter() : FXShutter(){}

    FXPySlider::FXPySlider(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXSlider(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPySlider::FXPySlider() : FXSlider(){}
    FXPySpinner::FXPySpinner(FXComposite *p,FXint cols,FXObject *tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXSpinner(p,cols,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPySpinner::FXPySpinner() : FXSpinner(){}
    FXPySplashWindow::FXPySplashWindow(FXApp* ap,FXIcon* ic,FXuint opts,FXuint ms) : FXSplashWindow(ap,ic,opts,ms){}
    FXPySplashWindow::FXPySplashWindow(FXWindow* ow,FXIcon* ic,FXuint opts,FXuint ms) : FXSplashWindow(ow,ic,opts,ms){}
    FXPySplashWindow::FXPySplashWindow() : FXSplashWindow(){}

    FXPySplitter::FXPySplitter(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXSplitter(p,opts,x,y,w,h){}
    FXPySplitter::FXPySplitter() : FXSplitter(){}
    FXPySplitter::FXPySplitter(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXSplitter(p,tgt,sel,opts,x,y,w,h){}

    FXPySpring::FXPySpring(FXComposite *p,FXuint opts,FXint relw,FXint relh,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXSpring(p,opts,relw,relh,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPySpring::FXPySpring() : FXSpring(){}
    FXPyStatusBar::FXPyStatusBar(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXStatusBar(p,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyStatusBar::FXPyStatusBar() : FXStatusBar(){}
    FXPyStatusLine::FXPyStatusLine(FXComposite* p,FXObject* tgt,FXSelector sel) : FXStatusLine(p,tgt,sel){}
    FXPyStatusLine::FXPyStatusLine() : FXStatusLine(){}

    FXPyStringDict::FXPyStringDict() : FXStringDict(){}

    FXPySwitcher::FXPySwitcher(FXComposite *p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXSwitcher(p,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPySwitcher::FXPySwitcher() : FXSwitcher(){}
    FXPyTGAIcon::FXPyTGAIcon(FXApp* a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXTGAIcon(a,pix,clr,opts,w,h){}
    FXPyTGAIcon::FXPyTGAIcon() : FXTGAIcon(){}
    FXPyTGAImage::FXPyTGAImage(FXApp* a,const void *pix,FXuint opts,FXint w,FXint h) : FXTGAImage(a,pix,opts,w,h){}
    FXPyTGAImage::FXPyTGAImage() : FXTGAImage(){}
    FXPyTIFIcon::FXPyTIFIcon(FXApp *a,const void *pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXTIFIcon(a,pix,clr,opts,w,h){}
    FXPyTIFIcon::FXPyTIFIcon() : FXTIFIcon(){}
    FXPyTIFImage::FXPyTIFImage(FXApp *a,const void *pix,FXuint opts,FXint w,FXint h) : FXTIFImage(a,pix,opts,w,h){}
    FXPyTIFImage::FXPyTIFImage() : FXTIFImage(){}
    FXPyTabBar::FXPyTabBar(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXTabBar(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyTabBar::FXPyTabBar() : FXTabBar(){}
    FXPyTabBook::FXPyTabBook(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXTabBook(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyTabBook::FXPyTabBook() : FXTabBook(){}
    FXPyTabItem::FXPyTabItem(FXTabBar* p,const FXString& text,FXIcon* ic,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXTabItem(p,text,ic,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyTabItem::FXPyTabItem() : FXTabItem(){}
    FXPyTableItem::FXPyTableItem(const FXString& text,FXIcon* ic,void* ptr) : FXTableItem(text,ic,ptr){}
    FXPyTableItem::FXPyTableItem() : FXTableItem(){}
    FXPyComboTableItem::FXPyComboTableItem(const FXString& text,FXIcon* ic,void* ptr) : FXComboTableItem(text,ic,ptr){}
    FXPyComboTableItem::FXPyComboTableItem() : FXComboTableItem(){}
    FXPyTable::FXPyTable(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXTable(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyTable::FXPyTable() : FXTable(){}
    FXPyText::FXPyText(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXText(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyText::FXPyText() : FXText(){}
    FXPyTextField::FXPyTextField(FXComposite* p,FXint ncols,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXTextField(p,ncols,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyTextField::FXPyTextField() : FXTextField(){}
    FXPyToggleButton::FXPyToggleButton(FXComposite* p,const FXString& text1,const FXString& text2,FXIcon* icon1,FXIcon* icon2,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXToggleButton(p,text1,text2,icon1,icon2,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyToggleButton::FXPyToggleButton() : FXToggleButton(){}
    FXPyToolBar::FXPyToolBar(FXComposite* p,FXComposite* q,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXToolBar(p,q,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyToolBar::FXPyToolBar(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXToolBar(p,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyToolBar::FXPyToolBar() : FXToolBar(){}

    FXPyToolBarGrip::FXPyToolBarGrip(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXToolBarGrip(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyToolBarGrip::FXPyToolBarGrip() : FXToolBarGrip(){}
    FXPyToolBarShell::FXPyToolBarShell(FXWindow* owner,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint hs,FXint vs) : FXToolBarShell(owner,opts,x,y,w,h,hs,vs){}
    FXPyToolBarShell::FXPyToolBarShell() : FXToolBarShell(){}
    FXPyToolBarTab::FXPyToolBarTab(FXComposite* p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXToolBarTab(p,tgt,sel,opts,x,y,w,h){}
    FXPyToolBarTab::FXPyToolBarTab() : FXToolBarTab(){}
    FXPyToolTip::FXPyToolTip(FXApp* a,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXToolTip(a,opts,x,y,w,h){}
    FXPyToolTip::FXPyToolTip() : FXToolTip(){}
    FXPyTopWindow::FXPyTopWindow(FXApp* ap,const FXString& name,FXIcon *ic,FXIcon *mi,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXTopWindow(ap,name,ic,mi,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyTopWindow::FXPyTopWindow(FXWindow* ow,const FXString& name,FXIcon *ic,FXIcon *mi,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXTopWindow(ow,name,ic,mi,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyTopWindow::FXPyTopWindow() : FXTopWindow(){}

    FXPyTranslator::FXPyTranslator(FXApp* a) : FXTranslator(a){}
    FXPyTranslator::FXPyTranslator() : FXTranslator(){}
    FXPyTreeItem::FXPyTreeItem(const FXString& text,FXIcon* oi,FXIcon* ci,void* ptr) : FXTreeItem(text,oi,ci,ptr){}
    FXPyTreeItem::FXPyTreeItem() : FXTreeItem(){}

    FXPyTreeList::FXPyTreeList(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXTreeList(p,tgt,sel,opts,x,y,w,h){}
    FXPyTreeList::FXPyTreeList() : FXTreeList(){}
    FXPyTreeListBox::FXPyTreeListBox(FXComposite *p,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXTreeListBox(p,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyTreeListBox::FXPyTreeListBox() : FXTreeListBox(){}
    FXPyTriStateButton::FXPyTriStateButton(FXComposite* p,const FXString& text1,const FXString& text2,const FXString& text3,FXIcon* icon1,FXIcon* icon2,FXIcon* icon3,FXObject* tgt,FXSelector sel,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb) : FXTriStateButton(p,text1,text2,text3,icon1,icon2,icon3,tgt,sel,opts,x,y,w,h,pl,pr,pt,pb){}
    FXPyTriStateButton::FXPyTriStateButton() : FXTriStateButton(){}

    FXPyVerticalFrame::FXPyVerticalFrame(FXComposite *p,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXVerticalFrame(p,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyVerticalFrame::FXPyVerticalFrame() : FXVerticalFrame(){}
    FXPyVisual::FXPyVisual(FXApp* a,FXuint flgs,FXuint d) : FXVisual(a,flgs,d){}
    FXPyVisual::FXPyVisual() : FXVisual(){}
    FXPyWindow::FXPyWindow(FXComposite* p,FXuint opts,FXint x,FXint y,FXint w,FXint h) : FXWindow(p,opts,x,y,w,h){}
    FXPyWindow::FXPyWindow() : FXWindow(){}
    FXPyWizard::FXPyWizard(FXApp* a,const FXString& name,FXImage *image,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXWizard(a,name,image,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}
    FXPyWizard::FXPyWizard() : FXWizard(){}
    FXPyWizard::FXPyWizard(FXWindow* owner,const FXString& name,FXImage *image,FXuint opts,FXint x,FXint y,FXint w,FXint h,FXint pl,FXint pr,FXint pt,FXint pb,FXint hs,FXint vs) : FXWizard(owner,name,image,opts,x,y,w,h,pl,pr,pt,pb,hs,vs){}

    FXPyXBMIcon::FXPyXBMIcon(FXApp* a,const FXuchar *pixels,const FXuchar *mask,FXColor clr,FXuint opts,FXint w,FXint h) : FXXBMIcon(a,pixels,mask,clr,opts,w,h){}
    FXPyXBMIcon::FXPyXBMIcon() : FXXBMIcon(){}
    FXPyXBMImage::FXPyXBMImage(FXApp* a,const FXuchar *pixels,const FXuchar *mask,FXuint opts,FXint w,FXint h) : FXXBMImage(a,pixels,mask,opts,w,h){}
    FXPyXBMImage::FXPyXBMImage() : FXXBMImage(){}
    FXPyXPMIcon::FXPyXPMIcon(FXApp* a,const FXchar **pix,FXColor clr,FXuint opts,FXint w,FXint h) : FXXPMIcon(a,pix,clr,opts,w,h){}
    FXPyXPMIcon::FXPyXPMIcon() : FXXPMIcon(){}
    FXPyXPMImage::FXPyXPMImage(FXApp* a,const FXchar **pix,FXuint opts,FXint w,FXint h) : FXXPMImage(a,pix,opts,w,h){}
    FXPyXPMImage::FXPyXPMImage() : FXXPMImage(){}
    FXPyCommandGroup::FXPyCommandGroup() : FXCommandGroup(){}
    FXPyUndoList::FXPyUndoList() : FXUndoList(){}
    FXPyCURCursor::FXPyCURCursor(FXApp* a,const void* pix) : FXCURCursor(a,pix){}
    FXPyCURCursor::FXPyCURCursor() : FXCURCursor(){}


/**
 * Stolen from fxruby:
 * Data targets for FXPy are implemented slightly different from
 * those in the C++ implementation since we don't have the concept
 * of C++ references for immutable types (like integers, floats and
 * strings).
 */

// Initialize a data target with this value
FX::FXPyDataTarget::FXPyDataTarget(PyObject *value,FXObject* tgt,FXSelector sel) : FXDataTarget(tgt,sel), intValue(0), doubleValue(0.0), boolValue(FALSE) {
  setValue(value);
  }

// Set new value for data target
void FX::FXPyDataTarget::setValue(PyObject *obj){
    if (PyLong_Check(obj)) {
        intValue=PyLong_AsLong(obj);
        connect(intValue);
    } else if (PyUnicode_Check(obj)){
        PyObject *str = PyUnicode_AsUTF8String(obj);
        if (str) {
            char *cstr;
            Py_ssize_t len;
            PyBytes_AsStringAndSize(str, &cstr, &len);
            char *newstr = (char *) malloc(len+1);
            memcpy(newstr,cstr,len+1);
            Py_XDECREF(obj);
        }
        connect(stringValue);
    } else if (PyBool_Check(obj)) {
        if (PyObject_IsTrue(obj)) {
            boolValue = TRUE;
        } else {
            boolValue = TRUE;
        }
        connect(boolValue);
    } else if (PyFloat_Check(obj)) {
        doubleValue = PyFloat_AsDouble(obj);
        connect(doubleValue);
    } else if (obj == Py_None) {
        connect();
    }
}

#if 0 // BAA
// Return current value for this data target
VALUE FXRbDataTarget::getValue() const {
  switch(type){
    case DT_VOID:
      return Qnil;
    case DT_CHAR:
      return to_ruby(*reinterpret_cast<FXchar*>(data));
    case DT_UCHAR:
      return to_ruby(*reinterpret_cast<FXuchar*>(data));
    case DT_SHORT:
      return to_ruby(*reinterpret_cast<FXshort*>(data));
    case DT_USHORT:
      return to_ruby(*reinterpret_cast<FXushort*>(data));
    case DT_INT:
      return to_ruby(*reinterpret_cast<FXint*>(data));
    case DT_UINT:
      return to_ruby(*reinterpret_cast<FXuint*>(data));
    case DT_LONG:
      return to_ruby(*reinterpret_cast<FXlong*>(data));
    case DT_ULONG:
      return to_ruby(*reinterpret_cast<FXulong*>(data));
    case DT_FLOAT:
      return to_ruby(*reinterpret_cast<FXfloat*>(data));
    case DT_DOUBLE:
      return to_ruby(*reinterpret_cast<FXdouble*>(data));
    case DT_STRING:
      return to_ruby(*reinterpret_cast<FXString*>(data));
    default:
      fxerror("unknown data type in FXRbDataTarget::getValue()");
    }
  return Qnil;
  }

#endif





extern FXint fxmalloc(void** ptr,unsigned long size);

}
#endif // BAA

// extern "C" char* SWIG_GetPtr(char*,void**,char*);
// extern "C" char* SWIG_GetPtrObj(PyObject*, void**, char*);
// extern "C" void SWIG_MakePtr(char*,void*,char*);

// extern FXAPI unsigned int fxTraceLevel;

/** Local copy of the current symbol table [as returned by vars()] */
static PyObject *pPyDict = 0;

#ifdef FXPy_WITH_THREADS
extern "C" {
	PyThreadState*	g_FXPyEventThreadState = NULL;
}
#endif

static unsigned int	g_FXPyNestCount = 0;

static PyThreadState* myPyThreadState_Get() {
	PyThreadState* current = PyThreadState_Swap(NULL);
	PyThreadState_Swap(current);
	return current;
}

FXbool FXPyRestoreThread() {
#ifdef FXPy_WITH_THREADS
	g_FXPyNestCount++;
	if (g_FXPyEventThreadState != myPyThreadState_Get()) {
		PyEval_RestoreThread(g_FXPyEventThreadState);
		return TRUE;
	} else
#endif
	return FALSE;
}

void FXPySaveThread(FXbool doSave) {
#ifdef FXPy_WITH_THREADS
	if (doSave) {
		g_FXPyEventThreadState = PyEval_SaveThread();
	}
	g_FXPyNestCount--;
#endif
}

/*
*  Call this function to stop the FOX event loop and stop
*  the program (because an exception of some kind was raised).
*  If "msg" is NULL, assume that Python has already set the
*  error object and data and just quit. If "msg" is not NULL,
*  this indicates some kind of FXPy runtime error (i.e. a
*  bug) and we need to set the error object & string for that.
*/
void raiseException(const char *msg = 0) {
	
#if 0 // BAA
	if (msg != 0) {
		fxTraceLevel = 11;
		FXTRACE((10, "raiseException() with msg = \"%s\"\n", msg));
		PyErr_SetString(FXPyApp::errorObject, msg);
	}
	else
		FXTRACE((10, "raiseException(NULL)\n"));
	FXPyApp::pythonExceptionRaised=TRUE;
	FXPyApp::instance()->stop(EXIT_FAILURE);
#endif
}

// Store pointer to Python dictionary
PyObject* FXPySetDict(PyObject *, PyObject *args)
{
	FXbool doSave = FXPyRestoreThread();
	if (!PyArg_Parse(args, "O", &pPyDict)) {
		FXPySaveThread(doSave);
		return NULL;
	}
	
	if (!PyDict_Check(pPyDict)) {
		PyErr_SetString(PyExc_TypeError,
			"FXPySetDict must have dictionary object!");
		FXPySaveThread(doSave);
		return NULL;
	}
	Py_INCREF(Py_None);
	FXPySaveThread(doSave);
	return Py_None;
}

/**
 * Convert a C++ class name into its SWIG pointer type representation.
 * For example, a pointer to an object of type FXObject has the SWIG
 * type "_FXObject_p".
 */
FXString FXPyGetSWIGPtrName(const char *s)
{
	FXString classname(s);
	return FXStringFormat("_%s_p", classname.text());
}


/**
 * Given a C++ class name, return the associated Python shadow class name.
 * For the class name "FXWindow" this will return "FX_Window", while for
 * FXPy C++ class names, like "FXPyWindow", this function will return the
 * "FXWindow".
 */
FXString FXPyGetPythonClassName(const FXString& classname)
{
	FXString pythonClassName(classname);
	if (pythonClassName.left(4) == "FXPy")
		pythonClassName = FXString("FX") + pythonClassName.right(pythonClassName.length() - 4);
	else
		pythonClassName = FXString("FX_") + pythonClassName.right(pythonClassName.length() - 2);
	return pythonClassName;
}


/**
 * Return new reference to a Python shadow class instance for
 * this FOX object. If we recognize the input FOX object as one
 * that's already paired with a Python shadow class instance, we
 * return a new reference to that already-existing shadow class
 * instance. Otherwise, we need to construct a new instance of
 * that shadow class on-the-fly.
 *
 * Note that this is highly dependent on SWIG1.1's shadow class
 * implementation. If the passed-in pointer is NULL, or if some
 * error occurs, the error flag is set and the function returns
 * NULL.
*/
#define FXMALLOC(ptr,type,no)     (FX::fxmalloc((void **)(ptr),sizeof(type)*(no)))


PyObject *
FXPyMakeShadowObject(const FXObject* obj)
{
	if (!obj)
		return NULL;

	// First see if it's one we already know about
	PyObject *shadow = FXPyGetPyObject(obj);
	if (shadow)
		return shadow;
	/**
	 *  A Python shadow class instance doesn't exist yet for this
	 *  C++ class instance, so we're going to have to instantiate
	 *  one on the fly.
	 */

	// First, determine the SWIG-mangled name for this class
	FXchar *buff;
	FXString swigPtrName = FXPyGetSWIGPtrName(obj->getClassName());
	FXMALLOC(&buff, FXchar, swigPtrName.length()+1);
	strcpy(buff, swigPtrName.text());
    fprintf(stderr, "make shadow: %s\n", buff);
    return Py_None;
#if 0 // BAA
	// Next, get the SWIG pointer representation (a string)
	char swigptr[128]; // FIXME
	SWIG_MakePtr(swigptr, (void*) obj, buff);
	FXFREE(&buff);
		
	// Get a pointer to the Python class object
	FXString pythonClassName = FXPyGetPythonClassName(obj->getClassName()) + "Ptr";
	FXMALLOC(&buff, FXchar, pythonClassName.length()+1);
	strcpy(buff, pythonClassName.text());
	FXbool doSave = FXPyRestoreThread();
	PyObject *classobj = PyDict_GetItemString(pPyDict, buff);
	FXFREE(&buff);
	if (!classobj) {
		FXPySaveThread(doSave);
		return NULL;
	}

	// Construct input argument for constructor
	PyObject *args = Py_BuildValue("(s)", swigptr);
	if (!args) {
		FXPySaveThread(doSave);
		return NULL;
	}

    shadow = PyObject_CallObject(classobj, args);
    // BAA	OLD STYLE CLASSES: shadow = PyInstance_New(classobj, args, NULL);
	Py_DECREF(args);
	FXPySaveThread(doSave);
	// FXPyRegister(shadow);
#endif // BAA
	return shadow;
}


// Return the class object for Python class FXEvent
static PyObject* FXPyGetEventClassObject(){
  static PyObject* EventClassObject=0;
  if(EventClassObject==0){
    FXbool doSave=FXPyRestoreThread();
    EventClassObject=PyDict_GetItemString(pPyDict,"new_FXEvent");
    FXPySaveThread(doSave);
    }
  return EventClassObject;
  }

//----------------------------------------------------------------------

static PyObject* to_python(FXint s){
  FXbool doSave=FXPyRestoreThread();
  PyObject* result=Py_BuildValue("i",s);
  FXPySaveThread(doSave);
  return result;
  }

static PyObject* to_python(FXuint s){
  FXbool doSave=FXPyRestoreThread();
  PyObject* result=Py_BuildValue("i",s);
  FXPySaveThread(doSave);
  return result;
  }

static PyObject* to_python(FXuchar c){
  FXbool doSave=FXPyRestoreThread();
  PyObject *result=Py_BuildValue("i",c);
  FXPySaveThread(doSave);
  return result;
  }

static PyObject* to_python(const FXchar *s){
  FXbool doSave=FXPyRestoreThread();
  PyObject* result=Py_BuildValue("s", s);
  FXPySaveThread(doSave);
  return result;
  }

static PyObject* to_python(const FXString& s){
  FXbool doSave=FXPyRestoreThread();
  PyObject* result=Py_BuildValue("s",s.text());
  FXPySaveThread(doSave);
  return result;
  }

static PyObject* to_python(FXObject* ptr){
  FXbool doSave=FXPyRestoreThread();
  PyObject* result;
  if(ptr){
    if(ptr==(FXObject*)-1){
      result=PyLong_FromLong(-1);
      }
    else{
      result=FXPyMakeShadowObject(ptr);
      }
    }
  else{
    result=Py_None;
    Py_INCREF(Py_None);
    }
  FXPySaveThread(doSave);
  return result;
  }



extern PyObject* FXWrapEvent(FX::FXEvent*);

static PyObject* to_python(FXEvent *ptr){
#if 1
  // Data is pointer to the FXEvent record
  char swigptr[128];
#if 1 //BAA  **** VERY IMPORTANT
  FXbool doSave=FXPyRestoreThread();
  PyObject* data = FXWrapEvent(ptr);
#else
  SWIG_MakePtr(swigptr,ptr,"_FXEvent_p");
  PyObject* eventClass=FXPyGetEventClassObject();
  FXbool doSave=FXPyRestoreThread();
  PyObject* args=Py_BuildValue("(s)", swigptr);
  BAA Oldstyle  PyObject* data=PyInstance_New(eventClass, args, NULL);
  Py_DECREF(args);
#endif
  FXPySaveThread(doSave);
  return data;
#endif
  }

static PyObject* to_python(FXTablePos* ptr){
  FXbool doSave=FXPyRestoreThread();
  Py_INCREF(Py_None);
  FXPySaveThread(doSave);
  return Py_None;
  }

static PyObject* to_python(FXTableRange* ptr){
  FXbool doSave=FXPyRestoreThread();
  Py_INCREF(Py_None);
  FXPySaveThread(doSave);
  return Py_None;
  }


// FIXME
static PyObject* to_python(FXTreeItem** ptr){
  FXbool doSave=FXPyRestoreThread();
  Py_INCREF(Py_None);
  FXPySaveThread(doSave);
  return Py_None;
  }


static PyObject* to_python(PyObject* obj){
  FXbool doSave=FXPyRestoreThread();
  Py_INCREF(obj);
  FXPySaveThread(doSave);
  return obj;
  }


// FIXME
static PyObject* to_python(FXStream& strm){
  return NULL;
  }


// FIXME
static PyObject* to_python(FXuint* array){
  FXbool doSave=FXPyRestoreThread();
  Py_INCREF(Py_None);
  FXPySaveThread(doSave);
  return Py_None;
  }

//----------------------------------------------------------------------
#if 1 // BAA delete later
#define FXASSERT assert
#define FXSELTYPE(s) ((FX::FXushort)(((s)>>16)&0xffff))
#endif
#define FXSELID(s) ((FX::FXushort)((s)&0xffff))
#define FXSELTYPE(s) ((FX::FXushort)(((s)>>16)&0xffff))

// Returns message data appropriate for a given sender/type combination
static PyObject *
FXPyGetMessageData(FXObject *sender, FXSelector sel, void *ptr)
{
	FXASSERT(sender != 0);
	FXushort type = FXSELTYPE(sel);
	if (type == SEL_PAINT ||
	    type == SEL_LEFTBUTTONPRESS ||
	    type == SEL_LEFTBUTTONRELEASE ||
	    type == SEL_MIDDLEBUTTONPRESS ||
	    type == SEL_MIDDLEBUTTONRELEASE ||
	    type == SEL_RIGHTBUTTONPRESS ||
	    type == SEL_RIGHTBUTTONRELEASE ||
	    type == SEL_KEYPRESS ||
	    type == SEL_KEYRELEASE ||
	    type == SEL_MOTION ||
	    type == SEL_BEGINDRAG ||
	    type == SEL_ENDDRAG ||
	    type == SEL_DRAGGED ||
	    type == SEL_ENTER ||
	    type == SEL_LEAVE ||
	    type == SEL_MAP ||
	    type == SEL_UNMAP ||
	    type == SEL_CONFIGURE ||
	    type == SEL_FOCUSIN ||
	    type == SEL_FOCUSOUT ||
	    type == SEL_DND_ENTER ||
	    type == SEL_DND_LEAVE ||
	    type == SEL_DND_MOTION ||
	    type == SEL_DND_DROP ||
	    type == SEL_DND_REQUEST ||
	    type == SEL_SELECTION_LOST ||
	    type == SEL_SELECTION_GAINED ||
	    type == SEL_SELECTION_REQUEST ||
	    type == SEL_CLIPBOARD_LOST ||
	    type == SEL_CLIPBOARD_GAINED ||
	    type == SEL_CLIPBOARD_REQUEST ||
	    type == SEL_UNGRABBED) {
		return to_python((FXEvent*) ptr);
	}
#if 1 // BAA
	else if (sender->isMemberOf(FXMETACLASS(FXArrowButton))) {
		if (type == SEL_CLICKED || type == SEL_COMMAND)
			return to_python(static_cast<FXuint>(reinterpret_cast<FXuval>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXButton))) {
		if (type == SEL_CLICKED ||
		    type == SEL_DOUBLECLICKED ||
		    type == SEL_TRIPLECLICKED ||
		    type == SEL_COMMAND)
			return to_python(static_cast<FXuint>(reinterpret_cast<FXuval>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXCheckButton))) {
		if (type == SEL_COMMAND)
			return to_python((FXuchar)((long) ptr));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXColorSelector))) {
		if (type == SEL_CHANGED || type == SEL_COMMAND)
			return to_python(static_cast<FXColor>(reinterpret_cast<FXuval>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXColorWell))) {
		if (type == SEL_CHANGED ||
		    type == SEL_COMMAND ||
		    type == SEL_CLICKED ||
		    type == SEL_DOUBLECLICKED ||
		    type == SEL_TRIPLECLICKED)
			return to_python(static_cast<FXColor>(reinterpret_cast<FXuval>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXComboBox))) {
		if (type == SEL_CHANGED || type == SEL_COMMAND)
			return to_python((const FXchar*) ptr);
	}
	else if (sender->isMemberOf(FXMETACLASS(FXDial))) {
		if (type == SEL_CHANGED || type == SEL_COMMAND)
			return to_python(static_cast<FXint>(reinterpret_cast<FXuval>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXDirBox))) {
		if (type == SEL_CHANGED || type == SEL_COMMAND)
			return to_python((const FXchar*) ptr);
	}
	else if (sender->isMemberOf(FXMETACLASS(FXFileList))) {
		if (type == SEL_CHANGED ||
		    type == SEL_CLICKED ||
		    type == SEL_DOUBLECLICKED ||
		    type == SEL_TRIPLECLICKED ||
		    type == SEL_COMMAND)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXGLViewer))) {
		if (type == SEL_CHANGED ||
		    type == SEL_CLICKED ||
		    type == SEL_DOUBLECLICKED ||
		    type == SEL_TRIPLECLICKED)
			return to_python((FXGLObject*) ptr);
		else if (type == SEL_COMMAND) {
			if (FXSELID(sel) == FXWindow::ID_QUERY_MENU)
				return to_python((FXEvent*) ptr);
			else
				return to_python((FXGLObject*) ptr);
		}
	}
	else if (sender->isMemberOf(FXMETACLASS(FXHeader))) {
		if (type == SEL_COMMAND || type == SEL_CHANGED)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXIconList))) {
		if (type == SEL_CHANGED ||
		    type == SEL_CLICKED ||
		    type == SEL_DOUBLECLICKED ||
		    type == SEL_TRIPLECLICKED ||
		    type == SEL_COMMAND)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXList))) {
		if (type == SEL_CHANGED ||
		    type == SEL_CLICKED ||
		    type == SEL_DOUBLECLICKED ||
		    type == SEL_TRIPLECLICKED ||
		    type == SEL_COMMAND)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXMDIChild))) {
		if (type == SEL_SELECTED ||
		    type == SEL_DESELECTED)
			return to_python((FXMDIChild*) ptr);
	}
	else if (sender->isMemberOf(FXMETACLASS(FXMDIClient))) {
		if (type == SEL_CHANGED)
			return to_python((FXMDIChild*) ptr);
	}
	else if (sender->isMemberOf(FXMETACLASS(FXRadioButton))) {
		if (type == SEL_COMMAND)
			return to_python((FXuchar)((long) ptr));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXRecentFiles))) {
		if (type == SEL_COMMAND)
			return to_python((const FXchar*) ptr);
	}
	else if (sender->isMemberOf(FXMETACLASS(FXScrollBar))) {
		if (type == SEL_CHANGED || type == SEL_COMMAND)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXShutter))) {
		if (type == SEL_COMMAND)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXSlider))) {
		if (type == SEL_CHANGED || type == SEL_COMMAND)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXTabBar))) {
		if (type == SEL_COMMAND)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXTabBook))) {
		if (type == SEL_COMMAND)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXTable))) {
		if (type == SEL_CLICKED ||
		    type == SEL_DOUBLECLICKED ||
		    type == SEL_TRIPLECLICKED ||
		    type == SEL_CHANGED ||
		    type == SEL_COMMAND)
			return to_python((FXTablePos*) ptr);
		else if (type == SEL_SELECTED ||
			 type == SEL_DESELECTED ||
			 type == SEL_INSERTED ||
			 type == SEL_DELETED)
			return to_python((FXTableRange*) ptr);
	}
	else if (sender->isMemberOf(FXMETACLASS(FXText))) {
		if (type == SEL_CHANGED)
			return to_python(static_cast<FXint>(reinterpret_cast<FXival>(ptr)));
		else if (type == SEL_SELECTED ||
				type == SEL_DESELECTED ||
				type == SEL_INSERTED ||
				type == SEL_DELETED) {
			FXint *what = (FXint *) ptr;
			FXbool doSave = FXPyRestoreThread();
			PyObject *tuple = PyTuple_New(2);
			PyTuple_SetItem(tuple, 0, PyLong_FromLong(what[0]));
			PyTuple_SetItem(tuple, 1, PyLong_FromLong(what[1]));
			FXPySaveThread(doSave);
			return tuple;
		}
		else if (type == SEL_REPLACED) {
			FXint *what = (FXint *) ptr;
			FXbool doSave = FXPyRestoreThread();
			PyObject *tuple = PyTuple_New(3);
			PyTuple_SetItem(tuple, 0, PyLong_FromLong(what[0]));
			PyTuple_SetItem(tuple, 1, PyLong_FromLong(what[1]));
			PyTuple_SetItem(tuple, 2, PyLong_FromLong(what[2]));
			FXPySaveThread(doSave);
			return tuple;
		}
	}
	else if (sender->isMemberOf(FXMETACLASS(FXTextField))) {
		if (type == SEL_CHANGED ||
		    type == SEL_COMMAND ||
		    type == SEL_VERIFY)
			return to_python((const FXchar*) ptr);
	}
	else if (sender->isMemberOf(FXMETACLASS(FXToggleButton))) {
		if (type == SEL_COMMAND)
			return to_python((FXuchar)((long) ptr));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXToolBarTab))) {
		if (type == SEL_CLICKED ||
		    type == SEL_DOUBLECLICKED ||
		    type == SEL_TRIPLECLICKED ||
		    type == SEL_COMMAND)
			return to_python((FXbool)((long) ptr));
	}
	else if (sender->isMemberOf(FXMETACLASS(FXTreeList))) {
		if (type == SEL_COLLAPSED ||
		    type == SEL_EXPANDED ||
		    type == SEL_COMMAND ||
		    type == SEL_CHANGED ||
		    type == SEL_CLICKED ||
		    type == SEL_DOUBLECLICKED ||
		    type == SEL_TRIPLECLICKED ||
		    type == SEL_OPENED ||
		    type == SEL_CLOSED)
			return to_python((FXTreeItem*) ptr);
		else if (type == SEL_SELECTED || type == SEL_DESELECTED)
			return to_python((FXTreeItem**) ptr);
	}
	else if (sender->isMemberOf(FXMETACLASS(FXTreeListBox))) {
		if (type == SEL_CHANGED || type == SEL_COMMAND)
			return to_python((FXTreeItem*) ptr);
	}
#endif // BAA
	// No match yet so return it as a string
	if (ptr == 0) {
		FXbool doSave = FXPyRestoreThread();
		Py_INCREF(Py_None);
		FXPySaveThread(doSave);
		return Py_None;
	}
	else {
		char s[256];
		sprintf(s, "%p", ptr);
		FXbool doSave = FXPyRestoreThread();
		PyObject *result = PyUnicode_FromString(s);
		FXPySaveThread(doSave);
		return result;
	}
}


// Check for handle
FXbool FXPyCanHandle(FXObject* self, FXSelector sel)
{
	
	// fprintf(stderr, "FXPyCanHandle() for %s (%p) and message (%d, %d)\n",
	//	self->getClassName(), self, FXSELID(sel), FXSELTYPE(sel));
	
	FXbool result = FALSE;
	PyObject* pPyObject = FXPyGetPyObject(self);
	if (pPyObject) {
		FXbool doSave = FXPyRestoreThread();
		if (PyObject_HasAttrString(pPyObject, "_fxmapsearch")) {
            
		    PyObject *pMethObj = PyObject_CallMethod(pPyObject, "_fxmapsearch", "(i)", sel);
			Py_DECREF(pPyObject);
			if (pMethObj) {
				if (pMethObj == Py_None) {
					Py_DECREF(pMethObj);
					result = FALSE;
				}
				else {
					Py_DECREF(pMethObj);
					result = TRUE;
				}
			}
		}
		else {
			Py_DECREF(pPyObject);
			raiseException("object didn't define an _search() method");
		}
		FXPySaveThread(doSave);
	}
	return result;
}


// Handle message
long FXPyHandle(FXObject* self, FXObject* sender, FXSelector sel, void* ptr)
{
	// fprintf(stderr, "FXPyHandle() for %s (%p) and message (%d, %d)\n",
	//	self->getClassName(), self, FXSELID(sel), FXSELTYPE(sel));

	// Get Python object for this C++ object
	PyObject *pPyObject = FXPyGetPyObject(self);
	if (pPyObject) {
		// Switch contexts
		FXbool doSave = FXPyRestoreThread();

		// Call _fxmapsearch() to get the method associated with this selector
		PyObject *pMethObj = PyObject_CallMethod(pPyObject, "_fxmapsearch", "(i)", sel);
		if (!pMethObj) {
            fprintf(stderr, "!pMethObj\n");
			Py_DECREF(pPyObject);
			raiseException();
			FXPySaveThread(doSave);
			return 0;
		}
		
		// If _search() returns None then we don't want to handle this one
		if (pMethObj == Py_None) {
            fprintf(stderr, "pMethObj == Py_None\n");
			Py_DECREF(Py_None);
			Py_DECREF(pPyObject);
			FXPySaveThread(doSave);
			return 0;
		}
		
		// Make sure it's really a callable object
		if (!PyCallable_Check(pMethObj)) {
			PyErr_SetString(PyExc_TypeError,
				"not a callable object");
			Py_DECREF(pMethObj);
			Py_DECREF(pPyObject);
			raiseException();
			FXPySaveThread(doSave);
			return 0;
		}

		// The sender may or may not have a Python counterpart, depending
		// on whether it was created in Python code or its some kind of
		// object created by FOX itself.
		PyObject *pSender = FXPyGetPyObject(sender);
		if (!pSender)
			pSender = FXPyMakeShadowObject(sender);

		if (pSender) {
			// Convert message data to something usable in Python
			PyObject *data = FXPyGetMessageData(sender, sel, ptr);

			// Call the message handler function (an unbound method)
			PyObject *pResObj = PyObject_CallFunction(pMethObj,
				"OOiO", pPyObject, pSender, sel, data);

			// Py_DECREF(data);
			Py_DECREF(pMethObj);
			Py_DECREF(pPyObject);

			// Message handler must return an integer value (or None)
			if (pResObj) {
				if (pResObj == Py_None) {
					Py_DECREF(Py_None);
					FXPySaveThread(doSave);
					return 1;
				}
				else if (PyLong_Check(pResObj)) {
					long nRes = PyLong_AsLong(pResObj);
					Py_DECREF(pResObj);
					FXPySaveThread(doSave);
					return nRes;
				}
				else {
					Py_DECREF(pResObj);
					raiseException("message handler function must return an integer");
					FXPySaveThread(doSave);
					return 1;
				}
			}
			else {
				raiseException();
				FXPySaveThread(doSave);
				return 1;
			}
		}
		else {
			Py_DECREF(pPyObject);
			Py_DECREF(pMethObj);
			raiseException();
			FXPySaveThread(doSave);
			return 0;
		}
	}
	return 1;
}


//----------------------------------------------------------------------

// Call a method named "func" of the shadow class "obj".
// The method is assumed to return None.
void FXPyCallVoidFunction(FXObject* obj,char* func){
  // Lookup shadow object pointer
  PyObject *pPyObject=FXPyGetPyObject(obj);

  if(pPyObject){
    // Call the function
    FXbool doSave=FXPyRestoreThread();
    PyObject *result=PyObject_CallMethod(pPyObject,func,NULL);
    Py_DECREF(pPyObject);
		
    // Function is expected to return None
    if(result){
      if(result==Py_None){
        Py_DECREF(Py_None);
        FXPySaveThread(doSave);
        return;
        }
      else{
        Py_DECREF(result);
        PyErr_SetString(PyExc_TypeError,"Expected function to return None");
        raiseException();
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  }


// Call a method named "func" of the shadow class "obj", passing
// it the shadow class instance for "arg1" as its single argument.
// The method is assumed to return None.
template<class TYPE>
void FXPyCallVoidFunction(const FXObject *obj,char *func,TYPE arg1){
  // Lookup shadow object pointer
  PyObject* pPyObject=FXPyGetPyObject(obj);

  if(pPyObject){
    // Call the function
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject *result=PyObject_CallMethod(pPyObject,func,"(O)",obj1);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
		
    // Function is expected to return None
    if(result){
      if(result==Py_None){
        Py_DECREF(Py_None);
        FXPySaveThread(doSave);
        return;
        }
      else{
        Py_DECREF(result);
        PyErr_SetString(PyExc_TypeError,"Expected function to return None");
        raiseException();
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  }


template<class TYPE1,class TYPE2>
void FXPyCallVoidFunction(FXObject* obj,char* func,TYPE1 arg1,TYPE2 arg2){
  // Lookup shadow object pointer
  PyObject* pPyObject=FXPyGetPyObject(obj);

  if(pPyObject){
    // Call the function
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* obj2=to_python(arg2);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(OO)",obj1,obj2);
    Py_DECREF(obj2);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
		
    // Function is expected to return None
    if(result){
      if(result==Py_None){
        Py_DECREF(Py_None);
        FXPySaveThread(doSave);
        return;
        }
      else{
        Py_DECREF(result);
        PyErr_SetString(PyExc_TypeError,"Expected function to return None");
        raiseException();
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  }

template<class TYPE1,class TYPE2,class TYPE3>
void FXPyCallVoidFunction(FXObject* obj,char* func,TYPE1 arg1,TYPE2 arg2,TYPE3 arg3){
  // Lookup shadow object pointer
  PyObject* pPyObject=FXPyGetPyObject(obj);

  if(pPyObject){
    // Call the function
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* obj2=to_python(arg2);
    PyObject* obj3=to_python(arg3);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(OOO)",obj1,obj2,obj3);
    Py_DECREF(obj3);
    Py_DECREF(obj2);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
		
    // Function is expected to return None
    if(result){
      if(result==Py_None){
        Py_DECREF(Py_None);
        FXPySaveThread(doSave);
        return;
        }
      else{
        Py_DECREF(result);
        PyErr_SetString(PyExc_TypeError,"Expected function to return None");
        raiseException();
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  }


template<class TYPE1,class TYPE2,class TYPE3,class TYPE4>
void FXPyCallVoidFunction(FXObject* obj,char* func,TYPE1 arg1,TYPE2 arg2,TYPE3 arg3,TYPE4 arg4){
  // Lookup shadow object pointer
  PyObject* pPyObject=FXPyGetPyObject(obj);

  if(pPyObject){
    // Call the function
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* obj2=to_python(arg2);
    PyObject* obj3=to_python(arg3);
    PyObject* obj4=to_python(arg4);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(OOOO)",obj1,obj2,obj3,obj4);
    Py_DECREF(obj4);
    Py_DECREF(obj3);
    Py_DECREF(obj2);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);

    // Function is expected to return None
    if(result){
      if(result==Py_None){
        Py_DECREF(Py_None);
        FXPySaveThread(doSave);
        return;
        }
      else{
        Py_DECREF(result);
        PyErr_SetString(PyExc_TypeError,"Expected function to return None");
        raiseException();
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  }


template<class TYPE1,class TYPE2,class TYPE3,class TYPE4,class TYPE5>
void FXPyCallVoidFunction(FXObject* obj,char* func,TYPE1 arg1,TYPE2 arg2,TYPE3 arg3,TYPE4 arg4,TYPE5 arg5){
  // Lookup shadow object pointer
  PyObject* pPyObject=FXPyGetPyObject(obj);

  if(pPyObject){
    // Call the function
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* obj2=to_python(arg2);
    PyObject* obj3=to_python(arg3);
    PyObject* obj4=to_python(arg4);
    PyObject* obj5=to_python(arg5);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(OOOOO)",obj1,obj2,obj3,obj4,obj5);
    Py_DECREF(obj5);
    Py_DECREF(obj4);
    Py_DECREF(obj3);
    Py_DECREF(obj2);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);

    // Function is expected to return None
    if(result){
      if(result==Py_None){
        Py_DECREF(Py_None);
        FXPySaveThread(doSave);
        return;
        }
      else{
        Py_DECREF(result);
        PyErr_SetString(PyExc_TypeError,"Expected function to return None");
        raiseException();
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  }


//----------------------------------------------------------------------


// Call a method named "func" of the shadow class "obj".
// The method is assumed to return a boolean value.
FXbool FXPyCallBoolFunction(const FXObject* obj,char* func){
  PyObject* pPyObject=FXPyGetPyObject(obj);
  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* result=PyObject_CallMethod(pPyObject,func,NULL);
    Py_DECREF(pPyObject);
    if(result){
      if(PyLong_Check(result)){
        FXbool bRes=(FXbool) PyLong_AsLong(result);
        Py_DECREF(result);
        FXPySaveThread(doSave);
        return bRes;
        }
      else{
        Py_DECREF(result);
        raiseException("Expected function to return 0 or 1");
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return FALSE;
  }


template<class TYPE>
FXbool FXPyCallBoolFunction(const FXObject* obj,char* func,TYPE arg1){
  PyObject* pPyObject=FXPyGetPyObject(obj);
  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(O)",obj1);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
    if(result){
      if(PyLong_Check(result)){
        FXbool bRes=(FXbool) PyLong_AsLong(result);
        Py_DECREF(result);
        FXPySaveThread(doSave);
        return bRes;
        }
      else{
        Py_DECREF(result);
        raiseException("Expected function to return 0 or 1");
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return FALSE;
  }


template<class TYPE1,class TYPE2>
FXbool FXPyCallBoolFunction(const FXObject* obj,char* func,TYPE1 arg1,TYPE2 arg2){
  PyObject* pPyObject=FXPyGetPyObject(obj);

  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* obj2=to_python(arg2);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(OO)",obj1,obj2);
    Py_DECREF(obj2);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
    if(result){
      if(PyLong_Check(result)){
        FXbool bRes=(FXbool) PyLong_AsLong(result);
        Py_DECREF(result);
        FXPySaveThread(doSave);
        return bRes;
        }
      else{
        Py_DECREF(result);
        raiseException("Expected function to return 0 or 1");
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return FALSE;
  }


template<class TYPE1,class TYPE2,class TYPE3>
FXbool FXPyCallBoolFunction(const FXObject* obj,char* func,TYPE1 arg1,TYPE2 arg2,TYPE3 arg3){
  PyObject* pPyObject=FXPyGetPyObject(obj);

  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* obj2=to_python(arg2);
    PyObject* obj3=to_python(arg3);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(OOO)",obj1,obj2,obj3);
    Py_DECREF(obj3);
    Py_DECREF(obj2);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
    if(result){
      if(PyLong_Check(result)){
        FXbool bRes=(FXbool) PyLong_AsLong(result);
        Py_DECREF(result);
        FXPySaveThread(doSave);
        return bRes;
        }
      else{
        Py_DECREF(result);
        raiseException("Expected function to return 0 or 1");
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return FALSE;
  }


template<class TYPE1,class TYPE2,class TYPE3,class TYPE4,class TYPE5>
FXbool FXPyCallBoolFunction(const FXObject* obj,char* func,TYPE1 arg1,TYPE2 arg2,TYPE3 arg3,TYPE4 arg4,TYPE5 arg5){
  PyObject* pPyObject=FXPyGetPyObject(obj);

  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* obj2=to_python(arg2);
    PyObject* obj3=to_python(arg3);
    PyObject* obj4=to_python(arg4);
    PyObject* obj5=to_python(arg5);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(OOOOO)",obj1,obj2,obj3,obj4,obj5);
    Py_DECREF(obj5);
    Py_DECREF(obj4);
    Py_DECREF(obj3);
    Py_DECREF(obj2);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
    if(result){
      if(PyLong_Check(result)){
        FXbool bRes=(FXbool) PyLong_AsLong(result);
        Py_DECREF(result);
        FXPySaveThread(doSave);
        return bRes;
        }
      else{
        Py_DECREF(result);
        raiseException("Expected function to return 0 or 1");
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return FALSE;
  }

//----------------------------------------------------------------------

// Call a method named "func" of the shadow class "obj".
// The method is assumed to return an FXint value.
FXint FXPyCallIntFunction(FXObject* obj,char* func){
  PyObject* pPyObject=FXPyGetPyObject(obj);
  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* result=PyObject_CallMethod(pPyObject,func,NULL);
    Py_DECREF(pPyObject);
    if(result){
      if(PyLong_Check(result)){
        FXint nResult=(FXint) PyLong_AsLong(result);
        Py_DECREF(result);
        FXPySaveThread(doSave);
        return nResult;
        }
      else{
        Py_DECREF(result);
        raiseException("Expected function to return an integer");
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return -1;
  }


template<class TYPE>
FXint FXPyCallIntFunction(FXObject* obj,char* func,TYPE arg1){
  PyObject* pPyObject=FXPyGetPyObject(obj);
  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(O)",obj1);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
    if(result){
      if(PyLong_Check(result)){
        FXint nResult=(FXint) PyLong_AsLong(result);
        Py_DECREF(result);
        FXPySaveThread(doSave);
        return nResult;
        }
      else{
        Py_DECREF(result);
        raiseException("Expected function to return an integer");
        }
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return -1;
  }

//----------------------------------------------------------------------
#if 0 // BAA
FXGLObject* FXPyCallGLObjectFunction(FXObject* obj,char* func){
  PyObject* pPyObject=FXPyGetPyObject(obj);
  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* result=PyObject_CallMethod(pPyObject,func,NULL);
    Py_DECREF(pPyObject);
    if(result){
      FXGLObject* glObjResult=(FXGLObject*)FXPyGetFXObject(result);
      Py_DECREF(result);
      FXPySaveThread(doSave);
      return glObjResult;
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return NULL;
  }


template<class TYPE>
FXGLObject* FXPyCallGLObjectFunction(FXObject* obj,char* func,TYPE arg1){
  PyObject* pPyObject=FXPyGetPyObject(obj);
  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(O)",obj1);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
    if(result){
      FXGLObject* glObjResult=(FXGLObject*)FXPyGetFXObject(result);
      Py_DECREF(result);
      FXPySaveThread(doSave);
      return glObjResult;
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return NULL;
  }


template<class TYPE1,class TYPE2>
FXGLObject* FXPyCallGLObjectFunction(FXObject* obj,char* func,TYPE1 arg1,TYPE2 arg2){
  PyObject* pPyObject=FXPyGetPyObject(obj);
  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* obj2=to_python(arg2);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(OO)",obj1,obj2);
    Py_DECREF(obj2);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
    if(result){
      FXGLObject* glObjResult=(FXGLObject*)FXPyGetFXObject(result);
      Py_DECREF(result);
      FXPySaveThread(doSave);
      return glObjResult;
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return NULL;
  }

//----------------------------------------------------------------------

// FIXME
template<class TYPE1,class TYPE2,class TYPE3,class TYPE4>
FXGLObject** FXPyCallGLObjectListFunction(FXObject* obj,char* func,TYPE1 arg1,TYPE2 arg2,TYPE3 arg3,TYPE4 arg4){
  PyObject* pPyObject=FXPyGetPyObject(obj);
  if(pPyObject){
    FXbool doSave=FXPyRestoreThread();
    PyObject* obj1=to_python(arg1);
    PyObject* obj2=to_python(arg2);
    PyObject* obj3=to_python(arg3);
    PyObject* obj4=to_python(arg4);
    PyObject* result=PyObject_CallMethod(pPyObject,func,"(OOOO)",obj1,obj2,obj3,obj4);
    Py_DECREF(obj4);
    Py_DECREF(obj3);
    Py_DECREF(obj2);
    Py_DECREF(obj1);
    Py_DECREF(pPyObject);
    if(result){
      FXGLObject** glObjResult=NULL;
      Py_DECREF(result);
      FXPySaveThread(doSave);
      return glObjResult;
      }
    else{
      raiseException();
      }
    FXPySaveThread(doSave);
    }
  return NULL;
  }

//----------------------------------------------------------------------

// long FXObject::onDefault(FXObject* sender,FXSelector sel,void* ptr)
static long
_onDefault(FXObject* fxObj,FXObject* sender,FXSelector sel,void* ptr) {
	PyObject *pyObj = FXPyGetPyObject(fxObj);
	if (pyObj != NULL) {
		PyObject *arg0 = FXPyMakeShadowObject(sender);
		if (arg0 == NULL) {
			FXbool doSave = FXPyRestoreThread();
			Py_DECREF(pyObj);
			FXPySaveThread(doSave);
			raiseException();
			return 0;
		}
		FXbool doSave = FXPyRestoreThread();
		PyObject *result = PyObject_CallMethod(pyObj, "onDefault", "(Oii)", arg0, sel, 0);
		Py_DECREF(arg0);
		Py_DECREF(pyObj);
		if (result != NULL) {
			if (PyLong_Check(result)) {
				long longResult = PyLong_AsLong(result);
				Py_DECREF(result);
				FXPySaveThread(doSave);
				return longResult;
			}
			else {
				Py_DECREF(result);
				raiseException("onDefault() should return an integer");
			}
			Py_DECREF(result);
		}
		else {
			raiseException();
		}
		FXPySaveThread(doSave);
	}
	return 0;
}


template <class ItemType, class ListType>
FXint _getWidth(const ItemType *self, const ListType *list)
{
	PyObject *obj = FXPyGetPyObject(self);
	if (obj) {
		PyObject *arg1 = FXPyMakeShadowObject(list);
		if (!arg1) {
			FXbool doSave = FXPyRestoreThread();
			Py_DECREF(obj);
			FXPySaveThread(doSave);
			raiseException();
			return -1;
		}
		FXbool doSave = FXPyRestoreThread();
		PyObject *result = PyObject_CallMethod(obj, "getWidth", "(O)", arg1);
		Py_DECREF(arg1);
		Py_DECREF(obj);
		if (result) {
			if (PyLong_Check(result)) {
				FXint w = PyLong_AsLong(result);
				Py_DECREF(result);
				FXPySaveThread(doSave);
				return w;
			}
			else {
				Py_DECREF(result);
				raiseException("getWidth() should return an integer");
				FXPySaveThread(doSave);
				return -1;
			}
		}
		else {
			raiseException();
			FXPySaveThread(doSave);
		}
	}
	return -1;
}

template <class ItemType, class ListType>
FXint _getHeight(const ItemType *self, const ListType *list)
{
	PyObject *obj = FXPyGetPyObject(self);
	if (obj) {
		PyObject *arg1 = FXPyMakeShadowObject(list);
		if (!arg1) {
			FXbool doSave = FXPyRestoreThread();
			Py_DECREF(obj);
			FXPySaveThread(doSave);
			raiseException();
			return -1;
		}
		FXbool doSave = FXPyRestoreThread();
		PyObject *result = PyObject_CallMethod(obj,
			"getHeight", "(O)", arg1);
		Py_DECREF(arg1);
		Py_DECREF(obj);
		if (result) {
			if (PyLong_Check(result)) {
				FXint h = PyLong_AsLong(result);
				Py_DECREF(result);
				FXPySaveThread(doSave);
				return h;
			}
			else {
				Py_DECREF(result);
				raiseException("getHeight() should return an integer");
				FXPySaveThread(doSave);
				return -1;
			}
		}
		else {
			raiseException();
			FXPySaveThread(doSave);
		}
	}
	return -1;
}
#endif // BAA

FX::FXHash::FXHash(FX::FXHash const&i) {}
#if 0 // BAA
#include "virtuals.cpp"

long FXPyMainWindow::onDefault(FXObject* sender,FXSelector sel,void* ptr) { return FXPyCallIntFunction(this,"onDefault"); }
long FXPyMainWindow::_onDefault(FXObject* sender,FXSelector sel,void* ptr) { return FXMainWindow::onDefault(sender,sel,ptr); }

void FXPyMainWindow::create(){ FXPyCallVoidFunction(this,"create"); }
void FXPyMainWindow::_create(){ FXMainWindow::create(); }

void FXPyMainWindow::destroy(){ FXPyCallVoidFunction(this,"destroy"); }
void FXPyMainWindow::_destroy(){ FXMainWindow::destroy(); }

void FXPyMainWindow::detach(){ FXPyCallVoidFunction(this,"detach"); }
void FXPyMainWindow::_detach(){ FXMainWindow::detach(); }

void FXPyMainWindow::resize(FXint w,FXint h){ FXPyCallVoidFunction(this,"resize",w,h); }
void FXPyMainWindow::_resize(FXint w,FXint h){ FXMainWindow::resize(w,h); }

void FXPyMainWindow::enable(){ FXPyCallVoidFunction(this,"enable"); }
void FXPyMainWindow::_enable(){ FXMainWindow::enable(); }

void FXPyMainWindow::disable(){ FXPyCallVoidFunction(this,"disable"); }
void FXPyMainWindow::_disable(){ FXMainWindow::disable(); }

//void FXPyMainWindow::show(){ FXPyCallVoidFunction(this,"show"); }
void FXPyMainWindow::show(){ FXPyCallVoidFunction(this,"show"); }
void FXPyMainWindow::_show(){ FXMainWindow::show(); }

void FXPyMainWindow::hide(){ FXPyCallVoidFunction(this,"hide"); }
void FXPyMainWindow::_hide(){ FXMainWindow::hide(); }

void FXPyMainWindow::lower(){ FXPyCallVoidFunction(this,"lower"); }
void FXPyMainWindow::_lowerWindow(){ FXMainWindow::lower(); }

FXint FXPyMainWindow::getDefaultHeight() { return FXPyCallIntFunction(this,"getDefaultHeight"); }
FXint FXPyMainWindow::_getDefaultHeight() { return FXMainWindow::getDefaultHeight(); }

FXint FXPyMainWindow::getDefaultWidth() { return FXPyCallIntFunction(this,"getDefaultWidth"); }
FXint FXPyMainWindow::_getDefaultWidth() { return FXMainWindow::getDefaultWidth(); }

FXint FXPyMainWindow::getWidthForHeight(FXint h) { return FXPyCallIntFunction(this,"getWidthForHeight",h); }
FXint FXPyMainWindow::_getWidthForHeight(FXint h) { return FXMainWindow::getWidthForHeight(h); }

FXint FXPyMainWindow::getHeightForWidth(FXint w) { return FXPyCallIntFunction(this,"getHeightForWidth",w); }
FXint FXPyMainWindow::_getHeightForWidth(FXint w) { return FXMainWindow::getHeightForWidth(w); }

void FXPyMainWindow::layout() { FXPyCallVoidFunction(this,"layout"); }
void FXPyMainWindow::_layout() { FXMainWindow::layout(); }

void FXPyMainWindow::recalc() { FXPyCallVoidFunction(this,"recalc"); }
void FXPyMainWindow::_recalc() { FXMainWindow::recalc(); }

bool FXPyMainWindow::isComposite() const { return FXPyCallBoolFunction(this,"isComposite"); }
bool FXPyMainWindow::_isComposite() const { return FXMainWindow::isComposite(); }

void FXPyMainWindow::move(FXint x,FXint y){ FXPyCallVoidFunction(this,"move",x,y); }
void FXPyMainWindow::_move(FXint x,FXint y){ FXMainWindow::move(x,y); }

void FXPyMainWindow::position(FXint x,FXint y,FXint w,FXint h){ FXPyCallVoidFunction(this,"position",x,y,w,h); }
void FXPyMainWindow::_position(FXint x,FXint y,FXint w,FXint h){ FXMainWindow::position(x,y,w,h); }

bool FXPyMainWindow::canFocus() const { return FXPyCallBoolFunction(this,"canFocus"); }
bool FXPyMainWindow::_canFocus() const { return FXMainWindow::canFocus(); }

void FXPyMainWindow::setFocus(){ FXPyCallVoidFunction(this,"setFocus"); }
void FXPyMainWindow::_setFocus(){ FXMainWindow::setFocus(); }

void FXPyMainWindow::killFocus(){ FXPyCallVoidFunction(this,"killFocus"); }
void FXPyMainWindow::_killFocus(){ FXMainWindow::killFocus(); }

void FXPyMainWindow::setDefault(FXbool enable){ FXPyCallVoidFunction(this,"setDefault",enable); }
void FXPyMainWindow::_setDefault(FXbool enable){ FXMainWindow::setDefault(enable); }

bool FXPyMainWindow::contains(FXint x,FXint y) const { return FXPyCallBoolFunction(this,"contains",x,y); }
bool FXPyMainWindow::_contains(FXint x,FXint y) const { return FXMainWindow::contains(x,y); }

bool FXPyMainWindow::doesSaveUnder() const { return FXPyCallBoolFunction(this,"doesSaveUnder"); }
bool FXPyMainWindow::_doesSaveUnder() const { return FXMainWindow::doesSaveUnder(); }

void FXPyMainWindow::reparent(FXComposite* newparent) { FXPyCallVoidFunction(this,"reparent",newparent); }
void FXPyMainWindow::_reparent(FXComposite* newparent) { FXMainWindow::reparent(newparent); }

void FXPyMainWindow::setBackColor(FXColor clr) { FXPyCallVoidFunction(this,"setBackColor",clr); }
void FXPyMainWindow::_setBackColor(FXColor clr) { FXMainWindow::setBackColor(clr); }

FXbool FXPyMainWindow::minimize(FXbool notify) { return FXPyCallBoolFunction(this,"minimize",notify); }
FXbool FXPyMainWindow::_minimize(FXbool notify) { return FXMainWindow::minimize(notify); }

FXbool FXPyMainWindow::maximize(FXbool notify) { return FXPyCallBoolFunction(this,"maximize",notify); }
FXbool FXPyMainWindow::_maximize(FXbool notify) { return FXMainWindow::maximize(notify); }

FXbool FXPyMainWindow::restore(FXbool notify)  { return FXPyCallBoolFunction(this,"restore",notify); }
FXbool FXPyMainWindow::_restore(FXbool notify) { return FXMainWindow::restore(notify); }

void FXPyMainWindow::show(FXuint placement) { FXPyCallVoidFunction(this, "show", placement); }
void FXPyMainWindow::_show(FXuint placement) { FXMainWindow::show(placement); }
long FXPyMainWindow::_handle(FXObject* sender,FXSelector sel,void* ptr){
  return FXMainWindow::handle(sender,sel,ptr);
  }
#endif // BAA
