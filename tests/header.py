
from FXPy import *

# Generated from file minidoc.gif
minidocraw = "47 49 46 38 37 61 10 00 10 00 f2 00 00 bf bf bf \
  80 80 80 ff ff ff c0 c0 c0 00 00 00 00 00 00 00 \
  00 00 00 00 00 2c 00 00 00 00 10 00 10 00 00 03 \
  36 08 10 dc ae 70 89 49 e7 08 51 56 3a 04 86 c1 \
  46 11 24 01 8a d5 60 2a 21 6a ad 9a ab 9e ae 30 \
  b3 b5 0d b7 f2 9e df 31 14 90 27 f4 d5 86 83 a4 \
  72 09 2c 39 9f a6 04 00 3b"


# Header Window
class HeaderWindow(FXMainWindow):
    (ID_ABOUT,
    ID_HEADER,
    ID_TRACKING,
    ID_LAST) = range(FXMainWindow.ID_LAST, FXMainWindow.ID_LAST+4)

    def __init__(self, app):
        super().__init__(app,"Header Control Test",None,None,DECOR_ALL,0,0,800,600)
        self.app = app

        # Map
        FXMAPFUNC(self, SEL_COMMAND,  HeaderWindow.ID_ABOUT,      HeaderWindow.onCmdAbout)
        FXMAPFUNC(self, SEL_CHANGED,  HeaderWindow.ID_HEADER,     HeaderWindow.onCmdHeader)
        FXMAPFUNC(self, SEL_COMMAND,  HeaderWindow.ID_HEADER,     HeaderWindow.onCmdHeaderButton)
        FXMAPFUNC(self, SEL_COMMAND,  HeaderWindow.ID_TRACKING,   HeaderWindow.onCmdContinuous)

        # Make menu bar
        menubar = FXMenuBar(self, self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X)

        FXStatusBar(self,LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X)

        filemenu = FXMenuPane(self)
        FXMenuCommand(filemenu,"&Quit\tCtl-Q\tQuit the application",None,self.app,FXApp.ID_QUIT)
        FXMenuTitle(menubar,"&File",None,filemenu)
        helpmenu = FXMenuPane(self)
        FXMenuCommand(helpmenu,"&About Header...",None,self,HeaderWindow.ID_ABOUT,0)
        FXMenuTitle(menubar,"&Help",None,helpmenu,LAYOUT_RIGHT)

        # Make Main Window contents
        contents = FXVerticalFrame(self,FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_TOP|LAYOUT_FILL_X|LAYOUT_FILL_Y,0,0,0,0, 0,0,0,0, 0,0)

        # Make header control
        self.header1 = FXHeader(contents,self,HeaderWindow.ID_HEADER,HEADER_BUTTON|HEADER_RESIZE|FRAME_RAISED|FRAME_THICK|LAYOUT_FILL_X)

        # Document icon
        minidoc = bytes.fromhex(minidocraw)
        doc = FXGIFIcon(self.app,minidoc)

        self.header1.appendItem("Name",doc,150)
        self.header1.appendItem("Type",None,120)
        self.header1.appendItem("Layout Option",doc,230)
        self.header1.appendItem("Attributes",None,80)

        # Below header
        panes = FXHorizontalFrame(contents,FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_TOP|LAYOUT_FILL_X|LAYOUT_FILL_Y,0,0,0,0, 0,0,0,0, 0,0)

        # Make 4 lists
        self.list = []
        self.list.append(FXList(panes,None,0,LAYOUT_FILL_Y|LAYOUT_FIX_WIDTH|LIST_BROWSESELECT,0,0,150,0))
        self.list.append(FXList(panes,None,0,LAYOUT_FILL_Y|LAYOUT_FIX_WIDTH|LIST_SINGLESELECT,0,0,120,0))
        self.list.append(FXList(panes,None,0,LAYOUT_FILL_Y|LAYOUT_FIX_WIDTH|LIST_MULTIPLESELECT,0,0,230,0))
        self.list.append(FXList(panes,None,0,LAYOUT_FILL_Y|LAYOUT_FIX_WIDTH|LIST_EXTENDEDSELECT,0,0,80,0))
        self.list[0].setBackColor(FXRGB(255,240,240))
        self.list[1].setBackColor(FXRGB(240,255,240))
        self.list[2].setBackColor(FXRGB(240,240,255))
        self.list[3].setBackColor(FXRGB(255,255,240))

        # Add some contents
        self.list[0].appendItem("Jeroen van der Zijp")
        self.list[0].appendItem("Lyle Johnson")
        self.list[0].appendItem("Freddy Golos")
        self.list[0].appendItem("Charles Warren")
        self.list[0].appendItem("Jonathan Bush")
        self.list[0].appendItem("Guoqing Tian")

        self.list[1].appendItem("Incorrigible Hacker")
        self.list[1].appendItem("Windows Hacker")
        self.list[1].appendItem("Russian Hacker")
        self.list[1].appendItem("Shutter Widget")
        self.list[1].appendItem("Progress Bar")
        self.list[1].appendItem("Dial Widget")

        self.list[2].appendItem("LAYOUT_FILL_X|LAYOUT_FILL_Y")
        self.list[2].appendItem("LAYOUT_FILL_Y")
        self.list[2].appendItem("LAYOUT_NORMAL")
        self.list[2].appendItem("LAYOUT_NORMAL")
        self.list[2].appendItem("LAYOUT_NORMAL")
        self.list[2].appendItem("LAYOUT_NORMAL")

        self.list[3].appendItem("A")
        self.list[3].appendItem("B")
        self.list[3].appendItem("C")
        self.list[3].appendItem("D")
        self.list[3].appendItem("E")
        self.list[3].appendItem("F")

        self.header2 = FXHeader(panes,None,0,HEADER_VERTICAL|HEADER_BUTTON|HEADER_RESIZE|FRAME_RAISED|FRAME_THICK|LAYOUT_FILL_Y)
        self.header2.appendItem("Example",None,30)
        self.header2.appendItem("Of",None,30)
        self.header2.appendItem("Vertical",None,30)
        self.header2.appendItem("Header",None,30)

        # Group box with some controls
        groupie = FXGroupBox(panes,"Controls",GROUPBOX_TITLE_CENTER|LAYOUT_FILL_X|LAYOUT_FILL_Y)
        check = FXCheckButton(groupie,"Continuous Tracking\tContinuous\tTrack Header continuously",self,HeaderWindow.ID_TRACKING,ICON_BEFORE_TEXT|LAYOUT_SIDE_TOP)

        # Whip out a tooltip control, jeez, that's hard
        FXToolTip(self.app)

    # About
    def onCmdAbout(self, sender, sel, ptr):
        FXMessageBox.information(self,MBOX_OK,"About Header",
                                 "An example of how to work with the header control\n\n\nAnd some attributes of the developers!")
        return 1

    # Changed the header control
    def onCmdHeader(self, sender, sel, ptr):
        which = ptr
        # print("onCmdHeader", which,type(which))
        assert(0<=which and which<4)
        print("Width of item",which,"=",self.header1.getItemSize(which))
        self.list[which].setWidth(self.header1.getItemSize(which))
        return 1

    # Clicked a header button:- we highlight all in the list
    def onCmdHeaderButton(self, sender, sel, ptr):
        which = ptr
        print("onCmdHeaderButton", which, self.list[which].getNumItems())
        assert(0<=which and which<4)
        for i in range(self.list[which].getNumItems()):
            self.list[which].selectItem(i)
        print("onCmdHeaderButton2")
        return 1

    # Tracking continuously
    def onCmdContinuous(self, sender, sel, ptr):
        print("onCmdContinuous")
        self.header1.setHeaderStyle(HEADER_TRACKING^self.header1.getHeaderStyle())
        self.header2.setHeaderStyle(HEADER_TRACKING^self.header2.getHeaderStyle())
        return 1

# Make application
application = FXApp("Header","FoxTest")

# Make window
win = HeaderWindow(application)

# Create all the windows.
application.create()
win.show()
# Run the application
application.run()
