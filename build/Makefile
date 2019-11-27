SRCS = FXPy.i

AUXSRCS =	FXObject.i \
		FXStream.i \
		FX4Splitter.i \
		FX7Segment.i \
		FXAccelTable.i \
		FXArrowButton.i \
		FXBMPIcon.i \
		FXBMPImage.i \
		FXBitmap.i \
		FXBitmapFrame.i \
		FXBitmapView.i \
		FXButton.i \
		FXCURCursor.i \
		FXCanvas.i \
		FXCheckButton.i \
		FXChoiceBox.i \
		FXColorBar.i \
		FXColorDialog.i \
		FXColorRing.i \
		FXColorSelector.i \
		FXColorWell.i \
		FXColorWheel.i \
		FXComboBox.i \
		FXComposite.i \
		FXCursor.i \
		FXDC.i \
		FXDCPrint.i \
		FXDCWindow.i \
		FXDataTarget.i \
		FXDebugTarget.i \
		FXDelegator.i \
		FXDial.i \
		FXDialogBox.i \
		FXDict.i \
		FXDirBox.i \
		FXDirDialog.i \
		FXDirList.i \
		FXDirSelector.i \
		FXDockBar.i \
		FXDockHandler.i \
		FXDockSite.i \
		FXDockTitle.i \
		FXDocument.i \
		FXDragCorner.i \
		FXDrawable.i \
		FXDriveBox.i \
		FXFileDialog.i \
		FXFileDict.i \
		FXFileList.i \
		FXFileSelector.i \
		FXFileStream.i \
		FXFoldingList.i \
		FXFont.i \
		FXFontDialog.i \
		FXFontSelector.i \
		FXFrame.i \
		FXGIFCursor.i \
		FXGIFIcon.i \
		FXGIFImage.i \
		FXGradientBar.i \
		FXGroupBox.i \
		FXHeader.i \
		FXHorizontalFrame.i \
		FXIcon.i \
		FXIconDict.i \
		FXIconList.i \
		FXIconSource.i \
		FXId.i \
		FXImage.i \
		FXImageFrame.i \
		FXImageView.i \
		FXInputDialog.i \
		FXJPGIcon.i \
		FXJPGImage.i \
		FXKnob.i \
		FXLabel.i \
		FXList.i \
		FXListBox.i \
		FXMDIButton.i \
		FXMDIChild.i \
		FXMDIClient.i \
		FXMatrix.i \
		FXMemoryStream.i \
		FXMenuBar.i \
		FXMenuButton.i \
		FXMenuCaption.i \
		FXMenuCascade.i \
		FXMenuCheck.i \
		FXMenuCommand.i \
		FXMenuPane.i \
		FXMenuRadio.i \
		FXMenuSeparator.i \
		FXMenuTitle.i \
		FXMessageBox.i \
		FXOptionMenu.i \
		FXPCXIcon.i \
		FXPCXImage.i \
		FXPNGIcon.i \
		FXPNGImage.i \
		FXPPMIcon.i \
		FXPPMImage.i \
		FXPacker.i \
		FXPicker.i \
		FXPipe.i \
		FXPopup.i \
		FXPrintDialog.i \
		FXProgressBar.i \
		FXProgressDialog.i \
		FXQuatd.i \
		FXQuatf.i \
		FXRGBIcon.i \
		FXRGBImage.i \
		FXRadioButton.i \
		FXRanged.i \
		FXRangef.i \
		FXRealSlider.i \
		FXRealSpinner.i \
		FXRecentFiles.i \
		FXRectangle.i \
		FXRegion.i \
		FXRegistry.i \
		FXReplaceDialog.i \
		FXRootWindow.i \
		FXRuler.i \
		FXRulerView.i \
		FXScrollArea.i \
		FXScrollBar.i \
		FXScrollPane.i \
		FXScrollWindow.i \
		FXSearchDialog.i \
		FXSeparator.i \
		FXSettings.i \
		FXShell.i \
		FXShutter.i \
		FXSize.i \
		FXSlider.i \
		FXSphered.i \
		FXSpheref.i \
		FXSpinner.i \
		FXSplashWindow.i \
		FXSplitter.i \
		FXSpring.i \
		FXStatusBar.i \
		FXStatusLine.i \
		FXStringDict.i \
		FXSwitcher.i \
		FXTGAIcon.i \
		FXTGAImage.i \
		FXTIFIcon.i \
		FXTIFImage.i \
		FXTabBar.i \
		FXTabBook.i \
		FXTabItem.i \
		FXTable.i \
		FXText.i \
		FXTextField.i \
		FXToggleButton.i \
		FXToolBar.i \
		FXToolBarGrip.i \
		FXToolBarShell.i \
		FXToolBarTab.i \
		FXToolTip.i \
		FXTranslator.i \
		FXTreeList.i \
		FXTreeListBox.i \
		FXTriStateButton.i \
		FXUndoList.i \
		FXVec2d.i \
		FXVec2f.i \
		FXVec3d.i \
		FXVec3f.i \
		FXVec4d.i \
		FXVec4f.i \
		FXVerticalFrame.i \
		FXVisual.i \
		FXWindow.i \
		FXWizard.i \
		FXXBMIcon.i \
		FXXBMImage.i \
		FXXPMIcon.i \
		FXXPMImage.i \
		FXExtentd.i \
		FXExtentf.i \
		FXMainWindow.i \
		FXTopWindow.i \
		FXColorList.i \
		FXGLViewer.i \
		FXGLObject.i \
		FXGLShape.i \
		FXGLCone.i \
		FXGLCanvas.i \
		FXGLContext.i \
		FXGLCube.i \
		FXGLCylinder.i \
		FXGLSphere.i \
		FXGLTriangleMesh.i \
		FXGLVisual.i \
		FXString.i \
		FXApp.i 

FXGLSRCS = 	FXObjectList.i

INCLUDEDSRCS = pytypemaps.i \
			   renames.i

vpath %.i ../swig
vpath %.h ../include
vpath %.cpp ../src

OBJS = $(patsubst %.i,%_wrap.o,${SRCS}) FXPy.o

default: _FXPy.so

%_wrap.cxx: %.i %.h
	swig -c++ -python -keyword -I.. -o $@ $< 

FXPy_wrap.cxx: ${SRCS} ${AUXSRCS} ${INCLUDEDSRCS} Makefile
	swig -c++ -python -keyword -I.. -o $@ $< 

%.o: %.cxx
	g++ -g -fPIC -I/usr/include/python3.7m -I../include -I../include -I.. -lFOX-1.6 -c $< -o $@

%.o: %.cpp
	g++ -g -fPIC -I/usr/include/python3.7m -I../include -I../include -I.. -lFOX-1.6 -c $< -o $@

%.pre: %.cxx
	g++ -fPIC -I/usr/include/python3.7m -I../include -I.. -E $< -o $@

%.pre: %.cpp
	g++ -fPIC -I/usr/include/python3.7m -I../include -I.. -E $< -o $@

_FXPy.so: ${OBJS} FXPy.o
	gcc -g -shared $< FXPy.o -Xlinker -rpath -Xlinker /usr/local/lib64/libFOX-1.6 -L/usr/local/lib64 -lFOX-1.6 -lpython3 -lstdc++ -o _FXPy.so

clean:
	rm *_wrap.cxx *_wrap.o

_FXString.so: FXString.h FXString2.i Makefile
	swig -c++ -python -I.. -o FXString_wrap.cxx ../swig/FXString2.i 
	g++ -g -fPIC -I/usr/include/python3.7m -I../include -I../include -I.. -lFOX-1.6 -c FXString_wrap.cxx -o FXString_wrap.o
	gcc -g -shared FXString_wrap.o -Xlinker -rpath -Xlinker /usr/local/lib64/libFOX-1.6 -L/usr/local/lib64 -lFOX-1.6 -lpython3 -lstdc++ -o _FXString.so
