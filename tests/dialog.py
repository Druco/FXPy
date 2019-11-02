
from FXPy import *

class FXTestDialog(FXDialogBox):
    # Mini application object

    # FXTestDialog implementation

    # Construct a dialog box
    def __init__(self, owner, app):
        super().__init__(owner,"Test of Dialog Box",DECOR_TITLE|DECOR_BORDER)

        # Bottom buttons
        buttons = FXHorizontalFrame(self,LAYOUT_SIDE_BOTTOM|FRAME_NONE|LAYOUT_FILL_X|PACK_UNIFORM_WIDTH,0,0,0,0,40,40,20,20)

        # Separator
        FXHorizontalSeparator(self,LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X|SEPARATOR_GROOVE)

        # Contents
        contents= FXHorizontalFrame(self,LAYOUT_SIDE_TOP|FRAME_NONE|LAYOUT_FILL_X|LAYOUT_FILL_Y|PACK_UNIFORM_WIDTH)

        submenu=FXMenuPane(self)
        FXMenuCommand(submenu,"One")
        FXMenuCommand(submenu,"Two")
        FXMenuCommand(submenu,"Three")

        # Menu
        menu=FXMenuPane(self)
        FXMenuCommand(menu,"&Accept",None,self,FXDialogBox.ID_ACCEPT)
        FXMenuCommand(menu,"&Cancel",None,self,FXDialogBox.ID_CANCEL)
        FXMenuCascade(menu,"Submenu",None,submenu)
        FXMenuCommand(menu,"&Quit\tCtl-Q",None,app,FXApp.ID_QUIT)

        # Popup menu
        pane=FXPopup(self)
        FXOption(pane,"One",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)
        FXOption(pane,"Two",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)
        FXOption(pane,"Three",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)
        FXOption(pane,"Four",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)
        FXOption(pane,"Five",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)
        FXOption(pane,"Six",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)
        FXOption(pane,"Seven",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)
        FXOption(pane,"Eight",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)
        FXOption(pane,"Nine",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)
        FXOption(pane,"Ten",None,None,0,JUSTIFY_HZ_APART|ICON_AFTER_TEXT)

        combobox= FXComboBox(contents,10,None,0,COMBOBOX_STATIC|FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_TOP)
        combobox.setNumVisible(4)
        combobox.appendItem("One")
        combobox.appendItem("Two")
        combobox.appendItem("Three")
        combobox.appendItem("Four")

        # Option menu
        FXOptionMenu(contents,pane,FRAME_RAISED|FRAME_THICK|JUSTIFY_HZ_APART|ICON_AFTER_TEXT|LAYOUT_CENTER_X|LAYOUT_CENTER_Y)

        # Button to pop menu
        FXMenuButton(contents,"&Menu",None,menu,MENUBUTTON_DOWN|JUSTIFY_LEFT|LAYOUT_TOP|FRAME_RAISED|FRAME_THICK|ICON_AFTER_TEXT|LAYOUT_CENTER_X|LAYOUT_CENTER_Y)

        # Accept
        FXButton(buttons,"&Accept",None,self,FXDialogBox.ID_ACCEPT,BUTTON_DEFAULT|BUTTON_INITIAL|FRAME_RAISED|FRAME_THICK|LAYOUT_RIGHT|LAYOUT_CENTER_Y)

        # Cancel
        FXButton(buttons,"&Cancel",None,self,FXDialogBox.ID_CANCEL,BUTTON_DEFAULT|FRAME_RAISED|FRAME_THICK|LAYOUT_RIGHT|LAYOUT_CENTER_Y)



class DialogTester(FXMainWindow):
    # Messages
    (ID_SHOWDIALOG,
     ID_SHOWDIALOGMODAL) = range(FXMainWindow.ID_LAST, FXMainWindow.ID_LAST+2)

    def __init__(self, app):
        # Make some windows
        super().__init__(app,"Group Box Test",None,None,DECOR_ALL,0,0,400,200)

        # Map
        FXMAPFUNC(self, SEL_COMMAND,  DialogTester.ID_SHOWDIALOG,      DialogTester.onCmdShowDialog)
        FXMAPFUNC(self, SEL_COMMAND,  DialogTester.ID_SHOWDIALOGMODAL, DialogTester.onCmdShowDialogModal)

        self.app = app

        # Tooltip
        FXToolTip(app)

        # Menubar
        menubar= FXMenuBar(self,self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X)

        # File Menu
        filemenu=FXMenuPane(self)
        FXMenuCommand(filemenu,"&Quit\tCtl-Q",None,app,FXApp.ID_QUIT,0)
        FXMenuTitle(menubar,"&File",None,filemenu)

        # Separator
        FXHorizontalSeparator(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X|SEPARATOR_GROOVE)

        # Contents
        contents= FXHorizontalFrame(self,LAYOUT_SIDE_BOTTOM|FRAME_NONE|LAYOUT_FILL_X|PACK_UNIFORM_WIDTH)

        # Button to pop normal dialog
        FXButton(contents,"&Non-Modal Dialog...\tDisplay normal dialog",None,self,DialogTester.ID_SHOWDIALOG,FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_X|LAYOUT_CENTER_Y)

        # Button to pop modal dialog
        FXButton(contents,"&Modal Dialog...\tDisplay modal dialog",None,self,DialogTester.ID_SHOWDIALOGMODAL,FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_X|LAYOUT_CENTER_Y)

        # Build a dialog box
        self.dialog=FXTestDialog(self, self.app)

        # Separator
        FXHorizontalSeparator(self,LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X|SEPARATOR_GROOVE)


    # Open
    def onCmdShowDialog(self, sender, sel, ptr):
        self.dialog.show(PLACEMENT_OWNER)
        return 1

    # Option
    def onCmdShowDialogModal(self, sender, sel, ptr):
        modaldialog = FXTestDialog(self, self.app)
        modaldialog.execute(PLACEMENT_OWNER)
        return 1


# Make application
application = FXApp("Dialog","FoxTest")

win = DialogTester(application)

# Create app
application.create()

win.show()
# Run
application.run()
