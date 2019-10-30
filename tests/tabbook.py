
from FXPy import *

# Main Window
class TabBookWindow(FXMainWindow):
    # Messages
    (ID_TABS_TOP,
     ID_TABS_BOTTOM,
     ID_TABS_LEFT,
     ID_TABS_RIGHT,
     ID_HIDESHOW,
     ID_PANEL,
     ID_PACK_UNIFORM_WIDTH,
     ID_PACK_NON_UNIFORM_WIDTH,
     ID_LAST
    ) = range(FXMainWindow.ID_LAST, FXMainWindow.ID_LAST+9)


    def __init__(self, app):
        super().__init__(app,"Tab Book Test",None,None,DECOR_ALL,0,0,600,400)
        # Map
        FXMAPFUNCS(self, SEL_COMMAND,TabBookWindow.ID_TABS_TOP,TabBookWindow.ID_TABS_RIGHT,TabBookWindow.onCmdTabOrient)
        FXMAPFUNC(self, SEL_COMMAND,TabBookWindow.ID_HIDESHOW,TabBookWindow.onCmdHideShow)
        FXMAPFUNC(self, SEL_COMMAND,TabBookWindow.ID_PANEL,TabBookWindow.onCmdPanel)
        FXMAPFUNC(self, SEL_COMMAND,TabBookWindow.ID_PACK_UNIFORM_WIDTH,TabBookWindow.onCmdPackUniformWidth)
        FXMAPFUNC(self, SEL_COMMAND,TabBookWindow.ID_PACK_NON_UNIFORM_WIDTH,TabBookWindow.onCmdPackNonUniformWidth)

        # Make some windows

        # Tooltip
        FXToolTip(app)

        # Menubar
        self.menubar = FXMenuBar(self,self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X)

        # Separator
        FXHorizontalSeparator(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X|SEPARATOR_GROOVE)

        # Contents
        self.contents = FXHorizontalFrame(self,LAYOUT_SIDE_TOP|FRAME_NONE|LAYOUT_FILL_X|LAYOUT_FILL_Y|PACK_UNIFORM_WIDTH)

        # Switcher
        self.tabbook = FXTabBook(self.contents,self,TabBookWindow.ID_PANEL,PACK_UNIFORM_WIDTH|PACK_UNIFORM_HEIGHT|LAYOUT_FILL_X|LAYOUT_FILL_Y|LAYOUT_RIGHT)

        # First item is a list
        self.tab1 = FXTabItem(self.tabbook,"&Simple List",None)

        listframe = FXHorizontalFrame(self.tabbook,FRAME_THICK|FRAME_RAISED)
        boxframe = FXHorizontalFrame(listframe,FRAME_THICK|FRAME_SUNKEN|LAYOUT_FILL_X|LAYOUT_FILL_Y, 0,0,0,0, 0,0,0,0)
        simplelist = FXList(boxframe,None,0,LIST_EXTENDEDSELECT|LAYOUT_FILL_X|LAYOUT_FILL_Y)
        simplelist.appendItem("First Entry")
        simplelist.appendItem("Second Entry")
        simplelist.appendItem("Third Entry")
        simplelist.appendItem("Fourth Entry")

        # Second item is a file list
        self.tab2 = FXTabItem(self.tabbook,"F&ile List",None)
        self.fileframe = FXHorizontalFrame(self.tabbook,FRAME_THICK|FRAME_RAISED)
        boxframe = FXHorizontalFrame(self.fileframe,FRAME_THICK|FRAME_SUNKEN|LAYOUT_FILL_X|LAYOUT_FILL_Y, 0,0,0,0, 0,0,0,0)
        filelist = FXFileList(boxframe,None,0,ICONLIST_EXTENDEDSELECT|LAYOUT_FILL_X|LAYOUT_FILL_Y)

        # Third item is a directory list
        self.tab3 = FXTabItem(self.tabbook,"T&ree List",None)
        dirframe = FXHorizontalFrame(self.tabbook,FRAME_THICK|FRAME_RAISED)
        boxframe = FXHorizontalFrame(dirframe,FRAME_THICK|FRAME_SUNKEN|LAYOUT_FILL_X|LAYOUT_FILL_Y, 0,0,0,0, 0,0,0,0)
        dirlist = FXDirList(boxframe,None,0,DIRLIST_SHOWFILES|TREELIST_SHOWS_LINES|TREELIST_SHOWS_BOXES|LAYOUT_FILL_X|LAYOUT_FILL_Y)

        # Fourth item is text
        self.tab4 = FXTabItem(self.tabbook,"Text",None)
        textframe = FXHorizontalFrame(self.tabbook,FRAME_THICK|FRAME_RAISED)
        boxframe = FXHorizontalFrame(textframe,FRAME_THICK|FRAME_SUNKEN|LAYOUT_FILL_X|LAYOUT_FILL_Y, 0,0,0,0, 0,0,0,0)
        text = FXText(boxframe,None,0,LAYOUT_FILL_X|LAYOUT_FILL_Y)

        # File Menu
        filemenu = FXMenuPane(self)
        FXMenuCommand(filemenu,"&Simple List",None,self.tabbook,FXTabBar.ID_OPEN_FIRST+0)
        FXMenuCommand(filemenu,"F&ile List",None,self.tabbook,FXTabBar.ID_OPEN_FIRST+1)
        FXMenuCommand(filemenu,"T&ree List",None,self.tabbook,FXTabBar.ID_OPEN_FIRST+2)
        FXMenuCommand(filemenu,"&Quit\tCtl-Q",None,app,FXApp.ID_QUIT)
        FXMenuTitle(self.menubar,"&File",None,filemenu)

        # Tab side
        tabmenu = FXMenuPane(self)
        FXMenuCommand(tabmenu,"Hide/Show Tab 2",None,self,TabBookWindow.ID_HIDESHOW)
        FXMenuCommand(tabmenu,"&Top Tabs",None,self,TabBookWindow.ID_TABS_TOP)
        FXMenuCommand(tabmenu,"&Bottom Tabs",None,self,TabBookWindow.ID_TABS_BOTTOM)
        FXMenuCommand(tabmenu,"&Left Tabs",None,self,TabBookWindow.ID_TABS_LEFT)
        FXMenuCommand(tabmenu,"&Right Tabs",None,self,TabBookWindow.ID_TABS_RIGHT)
        FXMenuCommand(tabmenu,"&Uniform Width Tabs",None,self,TabBookWindow.ID_PACK_UNIFORM_WIDTH)
        FXMenuCommand(tabmenu,"&Nonuniform Width Tabs",None,self,TabBookWindow.ID_PACK_NON_UNIFORM_WIDTH)
        FXMenuTitle(self.menubar,"&Tab Placement",None,tabmenu)

    # Switch tab orientations
    def onCmdTabOrient(self, sender, sel, ptr):
        sid = FXSELID(sel)
        print("in onCmdTabOrient", sid, TabBookWindow.ID_TABS_TOP, TabBookWindow.ID_TABS_BOTTOM)
        if sid == TabBookWindow.ID_TABS_TOP:
            self.tabbook.setTabStyle(TABBOOK_TOPTABS)
            self.tab1.setTabOrientation(TAB_TOP)
            self.tab2.setTabOrientation(TAB_TOP)
            self.tab3.setTabOrientation(TAB_TOP)
            self.tab4.setTabOrientation(TAB_TOP)
        elif sid == TabBookWindow.ID_TABS_BOTTOM:
            print("self.tabbook bottom1", TABBOOK_BOTTOMTABS)
            self.tabbook.setTabStyle(TABBOOK_BOTTOMTABS)
            print("self.tabbook bottom2")
            self.tab1.setTabOrientation(TAB_BOTTOM)
            self.tab2.setTabOrientation(TAB_BOTTOM)
            self.tab3.setTabOrientation(TAB_BOTTOM)
            self.tab4.setTabOrientation(TAB_BOTTOM)
            print("self.tabbook bottom3")
        elif sid == TabBookWindow.ID_TABS_LEFT:
            self.tabbook.setTabStyle(TABBOOK_LEFTTABS)
            self.tab1.setTabOrientation(TAB_LEFT)
            self.tab2.setTabOrientation(TAB_LEFT)
            self.tab3.setTabOrientation(TAB_LEFT)
            self.tab4.setTabOrientation(TAB_LEFT)
        elif sid ==  TabBookWindow.ID_TABS_RIGHT:
            self.tabbook.setTabStyle(TABBOOK_RIGHTTABS)
            self.tab1.setTabOrientation(TAB_RIGHT)
            self.tab2.setTabOrientation(TAB_RIGHT)
            self.tab3.setTabOrientation(TAB_RIGHT)
            self.tab4.setTabOrientation(TAB_RIGHT)
        return 1


    # Calculate tab header widths based on largest tab label string
    def onCmdPackUniformWidth(self, sender, sel, ptr):
        print("in onCmdPackUniformWidth", sel)
        sid=FXSELID(sel)
        packing_hints = self.tabbook.getPackingHints()
        packing_hints |= PACK_UNIFORM_WIDTH
        self.tabbook.setPackingHints(packing_hints)
        return 1

    # Calculate tab header width individually for each tab label string
    def onCmdPackNonUniformWidth(self, sender, sel, ptr):
        print("onCmdPackNonUniformWidth", sel)
        sid=FXSELID(sel)
        packing_hints = self.tabbook.getPackingHints()
        packing_hints &= ~PACK_UNIFORM_WIDTH
        self.tabbook.setPackingHints(packing_hints)
        return 1

    # Hide of show a panel
    def onCmdHideShow(self, sender, sel, ptr):
        if self.tab2.shown():
            self.tab2.hide()
            self.fileframe.hide()
        else:
            self.tab2.show()
            self.fileframe.show()
        self.tab2.recalc()
        self.fileframe.recalc()
        return 1

    # Active panel switched
    def onCmdPanel(self, sender, sel, ptr):
        print("in onCmdPanel")
        # FXTRACE((1,"Panel = %d\n",(FXint)(FXival)ptr))
        return 1


# Start the whole thing

# Make application
application = FXApp("TabBook","FoxTest")

# Build a window
win = TabBookWindow(application)

# Create app
application.create()
win.show()
# Run
application.run()
