
from FXPy import *

# Mini application object
class FourSplitWindow(FXMainWindow):
    def __init__(self, app):
        # Make some windows
        super().__init__(app,"4-Way Splitter Test",None,None,DECOR_ALL,0,0,900,700,0,0)

        # Menu bar
        menubar = FXMenuBar(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X)

        # Status bar
        FXStatusBar(self,LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X|STATUSBAR_WITH_DRAGCORNER)

        hf = FXHorizontalFrame(self,LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X)

        splitter = FX4Splitter(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X|LAYOUT_FILL_Y|FOURSPLITTER_TRACKING)

        # File menu
        filemenu = FXMenuPane(self)
        FXMenuCommand(filemenu,"&Quit\tCtl-Q\tQuit the application.",None,app,FXApp.ID_QUIT)
        FXMenuTitle(menubar,"&File",None,filemenu)

        # Expand menu
        expandmenu = FXMenuPane(self)
        FXMenuCheck(expandmenu,"All four",splitter,FX4Splitter.ID_EXPAND_ALL)
        FXMenuCheck(expandmenu,"Top/left",splitter,FX4Splitter.ID_EXPAND_TOPLEFT)
        FXMenuCheck(expandmenu,"Top/right",splitter,FX4Splitter.ID_EXPAND_TOPRIGHT)
        FXMenuCheck(expandmenu,"Bottom/left",splitter,FX4Splitter.ID_EXPAND_BOTTOMLEFT)
        FXMenuCheck(expandmenu,"Bottom/right",splitter,FX4Splitter.ID_EXPAND_BOTTOMRIGHT)
        FXMenuTitle(menubar,"&Expand",None,expandmenu)


        # Four widgets in the four splitter
        tl = FXButton(splitter,"Top &Left\tThis splitter tracks",None,None,0,FRAME_RAISED|FRAME_THICK)
        tr = FXButton(splitter,"Top &Right\tThis splitter tracks",None,None,0,FRAME_RAISED|FRAME_THICK)

        # To check bug from Tony <verant@hotpop.com>
        spl2 = FXSplitter(splitter,SPLITTER_VERTICAL|SPLITTER_TRACKING|LAYOUT_FILL_X|LAYOUT_FILL_Y)
        spl3 = FXSplitter(spl2,SPLITTER_HORIZONTAL|SPLITTER_TRACKING|LAYOUT_FILL_X|LAYOUT_FILL_Y)
        FXButton(spl3,"In SPLITTER_HORIZONTAL",None,None,0,FRAME_RAISED|FRAME_THICK)
        FXButton(spl3,"In SPLITTER_HORIZONTAL",None,None,0,FRAME_RAISED|FRAME_THICK)
        FXButton(spl2,"In SPLITTER_VERTICAL",None,None,0,FRAME_RAISED|FRAME_THICK)

        subsplitter= FX4Splitter(splitter,LAYOUT_FILL_X|LAYOUT_FILL_Y)
        temp=FXButton(subsplitter,"&Of course\tThis splitter does NOT track",None,None,0,FRAME_SUNKEN|FRAME_THICK)
        temp.setBackColor(FXRGB(0,128,0))
        temp.setTextColor(FXRGB(255,255,255))
        temp=FXButton(subsplitter,"the&y CAN\tThis splitter does NOT track",None,None,0,FRAME_SUNKEN|FRAME_THICK)
        temp.setBackColor(FXRGB(128,0,0))
        temp.setTextColor(FXRGB(255,255,255))
        temp=FXButton(subsplitter,"be &NESTED\tThis splitter does NOT track",None,None,0,FRAME_SUNKEN|FRAME_THICK)
        temp.setBackColor(FXRGB(0,0,200))
        temp.setTextColor(FXRGB(255,255,255))
        temp=FXButton(subsplitter,"&arbitrarily!\tThis splitter does NOT track",None,None,0,FRAME_SUNKEN|FRAME_THICK)
        temp.setBackColor(FXRGB(128,128,0))
        temp.setTextColor(FXRGB(255,255,255))

        FXLabel(hf,"Hide: ",None,LAYOUT_CENTER_Y|LAYOUT_LEFT)
        FXCheckButton(hf,"Top Left",tl,FXWindow.ID_TOGGLESHOWN,ICON_BEFORE_TEXT|LAYOUT_CENTER_Y|LAYOUT_LEFT)
        FXCheckButton(hf,"Top Right",tr,FXWindow.ID_TOGGLESHOWN,ICON_BEFORE_TEXT|LAYOUT_CENTER_Y|LAYOUT_LEFT)
        FXCheckButton(hf,"Bottom Left",spl2,FXWindow.ID_TOGGLESHOWN,ICON_BEFORE_TEXT|LAYOUT_CENTER_Y|LAYOUT_LEFT)
        FXCheckButton(hf,"Bottom Right",subsplitter,FXWindow.ID_TOGGLESHOWN,ICON_BEFORE_TEXT|LAYOUT_CENTER_Y|LAYOUT_LEFT)

        FXCheckButton(hf,"Bottom Right",splitter,FX4Splitter.ID_EXPAND_BOTTOMRIGHT,ICON_BEFORE_TEXT|LAYOUT_CENTER_Y|LAYOUT_RIGHT)
        FXCheckButton(hf,"Bottom Left",splitter,FX4Splitter.ID_EXPAND_BOTTOMLEFT,ICON_BEFORE_TEXT|LAYOUT_CENTER_Y|LAYOUT_RIGHT)
        FXCheckButton(hf,"Top Right",splitter,FX4Splitter.ID_EXPAND_TOPRIGHT,ICON_BEFORE_TEXT|LAYOUT_CENTER_Y|LAYOUT_RIGHT)
        FXCheckButton(hf,"Top Left",splitter,FX4Splitter.ID_EXPAND_TOPLEFT,ICON_BEFORE_TEXT|LAYOUT_CENTER_Y|LAYOUT_RIGHT)
        FXCheckButton(hf,"All",splitter,FX4Splitter.ID_EXPAND_ALL,ICON_BEFORE_TEXT|LAYOUT_CENTER_Y|LAYOUT_RIGHT)
        FXLabel(hf,"Expand: ",None,LAYOUT_CENTER_Y|LAYOUT_RIGHT)
        FXToolTip(app)

# Start the whole thing
application = FXApp("FourSplit","FoxTest")
win = FourSplitWindow(application)
application.create()
win.show()
application.run()
