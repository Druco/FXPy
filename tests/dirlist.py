# /********************************************************************************
# *                                                                               *
# *                  D i r e c t o r y   L i s t   C o n t r o l                  *
# *                                                                               *
# *********************************************************************************
# * Copyright (C) 1998,2006 by Jeroen van der Zijp.   All Rights Reserved.        *
# *********************************************************************************
# * $Id: dirlist.cpp,v 1.16 2006/01/22 17:58:59 fox Exp $                         *
# ********************************************************************************/
from FXPy import *



# Main Window
class DirListWindow(FXMainWindow):
    (ID_ABOUT,
     ID_LAST) = range(FXMainWindow.ID_LAST, FXMainWindow.ID_LAST + 2)

    def __init__(self, app):
        super().__init__(app, "Directory Linst", None, None, DECOR_ALL, 0, 0, 800, 600)
        menubar = FXMenuBar(self, LAYOUT_FILL_X)
        filemenu = FXMenuPane(self)
        FXMenuCommand(filemenu, "&Quit\tCtl-Q" ,None, app, FXApp.ID_QUIT)
        FXMenuTitle(menubar, "&File", None, filemenu)
        helpmenu = FXMenuPane(self)
        FXMenuCommand(helpmenu, "&About FOX...", None, self, DirListWindow.ID_ABOUT, 0)
        FXMenuTitle(menubar, "&Help", None, helpmenu, LAYOUT_RIGHT)

        # Text field at bottom
        text = FXTextField(self, 10, None, 0, LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X|FRAME_SUNKEN|FRAME_THICK)

        # Make contents
        contents = FXDirList(self, None, 0, HSCROLLING_OFF|TREELIST_SHOWS_LINES|TREELIST_SHOWS_BOXES|TREELIST_BROWSESELECT|FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X|LAYOUT_FILL_Y)

        text.setTarget(contents)
        text.setSelector(FXWindow.ID_SETVALUE)
        FXMAPFUNC(self, SEL_COMMAND, DirListWindow.ID_ABOUT, DirListWindow.onCmdAbout),

    # About
    def onCmdAbout(self, sender, sel, ptr):
        FXMessageBox.information(self ,MBOX_OK, "About FOX"," FOX is a really, really cool C++ library!")
        return 1


# Start the whole thing
# Make application
application = FXApp("DirList", "FoxTest")

# Make window
win = DirListWindow(application)

# Create app
application.create()

win.show()

# Run
application.run()
