
SRCS =	swig/FXPy.i


EXTRASRCS=	swig/FXObject.i \
		swig/FXStream.i \
		swig/FX4Splitter.i \
		swig/FX7Segment.i \
		swig/FXAccelTable.i \
		swig/FXArrowButton.i \
		swig/FXBMPIcon.i \
		swig/FXBMPImage.i \
		swig/FXBitmap.i \
		swig/FXBitmapFrame.i \
		swig/FXBitmapView.i \
		swig/FXButton.i \
		swig/FXCURCursor.i \
		swig/FXCanvas.i \
		swig/FXCheckButton.i \
		swig/FXChoiceBox.i \
		swig/FXColorBar.i \
		swig/FXColorDialog.i \
		swig/FXColorRing.i \
		swig/FXColorSelector.i \
		swig/FXColorWell.i \
		swig/FXColorWheel.i \
		swig/FXComboBox.i \
		swig/FXComposite.i \
		swig/FXCursor.i \
		swig/FXDC.i \
		swig/FXDCPrint.i \
		swig/FXDCWindow.i \
		swig/FXDataTarget.i \
		swig/FXDebugTarget.i \
		swig/FXDelegator.i \
		swig/FXDial.i \
		swig/FXDialogBox.i \
		swig/FXDict.i \
		swig/FXDirBox.i \
		swig/FXDirDialog.i \
		swig/FXDirList.i \
		swig/FXDirSelector.i \
		swig/FXDockBar.i \
		swig/FXDockHandler.i \
		swig/FXDockSite.i \
		swig/FXDockTitle.i \
		swig/FXDocument.i \
		swig/FXDragCorner.i \
		swig/FXDrawable.i \
		swig/FXDriveBox.i \
		swig/FXFileDialog.i \
		swig/FXFileDict.i \
		swig/FXFileList.i \
		swig/FXFileSelector.i \
		swig/FXFileStream.i \
		swig/FXFoldingList.i \
		swig/FXFont.i \
		swig/FXFontDialog.i \
		swig/FXFontSelector.i \
		swig/FXFrame.i \
		swig/FXGIFCursor.i \
		swig/FXGIFIcon.i \
		swig/FXGIFImage.i \
		swig/FXGradientBar.i \
		swig/FXGroupBox.i \
		swig/FXHeader.i \
		swig/FXHorizontalFrame.i \
		swig/FXIcon.i \
		swig/FXIconDict.i \
		swig/FXIconList.i \
		swig/FXIconSource.i \
		swig/FXId.i \
		swig/FXImage.i \
		swig/FXImageFrame.i \
		swig/FXImageView.i \
		swig/FXInputDialog.i \
		swig/FXJPGIcon.i \
		swig/FXJPGImage.i \
		swig/FXKnob.i \
		swig/FXLabel.i \
		swig/FXList.i \
		swig/FXListBox.i \
		swig/FXMDIButton.i \
		swig/FXMDIChild.i \
		swig/FXMDIClient.i \
		swig/FXMatrix.i \
		swig/FXMemoryStream.i \
		swig/FXMenuBar.i \
		swig/FXMenuButton.i \
		swig/FXMenuCaption.i \
		swig/FXMenuCascade.i \
		swig/FXMenuCheck.i \
		swig/FXMenuCommand.i \
		swig/FXMenuPane.i \
		swig/FXMenuRadio.i \
		swig/FXMenuSeparator.i \
		swig/FXMenuTitle.i \
		swig/FXMessageBox.i \
		swig/FXOptionMenu.i \
		swig/FXPCXIcon.i \
		swig/FXPCXImage.i \
		swig/FXPNGIcon.i \
		swig/FXPNGImage.i \
		swig/FXPPMIcon.i \
		swig/FXPPMImage.i \
		swig/FXPacker.i \
		swig/FXPicker.i \
		swig/FXPipe.i \
		swig/FXPopup.i \
		swig/FXPrintDialog.i \
		swig/FXProgressBar.i \
		swig/FXProgressDialog.i \
		swig/FXQuatd.i \
		swig/FXQuatf.i \
		swig/FXRGBIcon.i \
		swig/FXRGBImage.i \
		swig/FXRadioButton.i \
		swig/FXRanged.i \
		swig/FXRangef.i \
		swig/FXRealSlider.i \
		swig/FXRealSpinner.i \
		swig/FXRecentFiles.i \
		swig/FXRectangle.i \
		swig/FXRegion.i \
		swig/FXRegistry.i \
		swig/FXReplaceDialog.i \
		swig/FXRootWindow.i \
		swig/FXRuler.i \
		swig/FXRulerView.i \
		swig/FXScrollArea.i \
		swig/FXScrollBar.i \
		swig/FXScrollPane.i \
		swig/FXScrollWindow.i \
		swig/FXSearchDialog.i \
		swig/FXSeparator.i \
		swig/FXSettings.i \
		swig/FXShell.i \
		swig/FXShutter.i \
		swig/FXSize.i \
		swig/FXSlider.i \
		swig/FXSphered.i \
		swig/FXSpheref.i \
		swig/FXSpinner.i \
		swig/FXSplashWindow.i \
		swig/FXSplitter.i \
		swig/FXSpring.i \
		swig/FXStatusBar.i \
		swig/FXStatusLine.i \
		swig/FXStringDict.i \
		swig/FXSwitcher.i \
		swig/FXTGAIcon.i \
		swig/FXTGAImage.i \
		swig/FXTIFIcon.i \
		swig/FXTIFImage.i \
		swig/FXTabBar.i \
		swig/FXTabBook.i \
		swig/FXTabItem.i \
		swig/FXTable.i \
		swig/FXText.i \
		swig/FXTextField.i \
		swig/FXToggleButton.i \
		swig/FXToolBar.i \
		swig/FXToolBarGrip.i \
		swig/FXToolBarShell.i \
		swig/FXToolBarTab.i \
		swig/FXToolTip.i \
		swig/FXTranslator.i \
		swig/FXTreeList.i \
		swig/FXTreeListBox.i \
		swig/FXTriStateButton.i \
		swig/FXUndoList.i \
		swig/FXVec2d.i \
		swig/FXVec2f.i \
		swig/FXVec3d.i \
		swig/FXVec3f.i \
		swig/FXVec4d.i \
		swig/FXVec4f.i \
		swig/FXVerticalFrame.i \
		swig/FXVisual.i \
		swig/FXWindow.i \
		swig/FXWizard.i \
		swig/FXXBMIcon.i \
		swig/FXXBMImage.i \
		swig/FXXPMIcon.i \
		swig/FXXPMImage.i \
		swig/FXExtentd.i \
		swig/FXExtentf.i \
		swig/FXMainWindow.i \
		swig/FXTopWindow.i \
		swig/FXColorList.i \
		swig/FXApp.i 

FXGLSRCS = 	swig/FXObjectList.i \
		swig/FXGLObject.i \
		swig/FXGLShape.i \
		swig/FXGLCone.i \
		swig/FXGLCanvas.i \
		swig/FXGLContext.i \
		swig/FXGLCube.i \
		swig/FXGLCylinder.i \
		swig/FXGLSphere.i \
		swig/FXGLTriangleMesh.i \
		swig/FXGLVisual.i \
		swig/FXGLViewer.i

OBJS = $(patsubst swig/%.i,build/%_wrap.o,${SRCS})

%_wrap.cxx: %.i include/%.h
	swig -c++ -python $<

%.o: %.cxx
	g++ -fPIC -I/usr/include/python3.7m -I./include -lFOX-1.6 -c $<

%.pre: %.cxx
	g++ -fPIC -I/usr/include/python3.7m -I./include -lFOX-1.6 -E $< -o $@

default: _FXPy.so

_FXPy.so: ${OBJS}
	gcc -fPIC -shared ${OBJS} -Xlinker -rpath -Xlinker /usr/lib64/libFOX-1.6 -lFOX-1.6 -lpython3 -lstdc++ -o _FXPy.so

clean:
	rm *_wrap.cxx *_wrap.o
