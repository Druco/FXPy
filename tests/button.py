
from FXPy import *

# Mini application object
class ButtonWindow(FXMainWindow):
    (    # Messages to change icon/text relationship
        ID_ICON_BEFORE_TEXT,
        ID_ICON_AFTER_TEXT,
        ID_ICON_CENTER_HOR,
        ID_ICON_ABOVE_TEXT,
        ID_ICON_BELOW_TEXT,
        ID_ICON_CENTER_VER,

        # Messages to change justification
        ID_JUST_CENTER_X,
        ID_JUST_LEFT,
        ID_JUST_RIGHT,
        ID_JUST_HOR_APART,
        ID_JUST_CENTER_Y,
        ID_JUST_TOP,
        ID_JUST_BOTTOM,
        ID_JUST_VER_APART,

        # Message to change style
        ID_TOOLBAR_STYLE,

        # Message to quit application
        ID_QUIT) = range(FXMainWindow.ID_LAST, FXMainWindow.ID_LAST+16)

    # Icon data
    bigpenguin = "47 49 46 38 37 61 30 00 39 00 f3 00 00 b2 c0 dc \
    5a 52 41 0e 0b 0b 47 3b 26 71 6e 67 b7 b5 b0 d4 \
    d2 ce f9 f7 f7 99 8d 77 a3 77 1b ee ba 12 be a2 \
    14 8b 5e 07 b3 8b 27 ee c7 1c d2 98 0f 2c 00 00 \
    00 00 30 00 39 00 00 04 fe 10 c8 49 ab 0d 22 8b \
    61 bb ff 20 a6 8d 1c 68 9e d3 30 ae 19 81 be 9d \
    ca 66 81 e8 c2 38 31 6b 84 28 e0 38 d9 6e 15 00 \
    be 84 c3 91 11 95 9c dd 96 9f e1 20 30 40 16 a1 \
    51 01 a1 e0 1b 14 0a 06 9d e6 8a ed 6c 0c 85 83 \
    cc 70 40 18 0c a4 b2 67 5a 2d 00 32 07 4c 40 ad \
    29 c9 2b 74 5a 77 02 06 6b 5d 7f 16 2a 05 02 09 \
    0a 0a 0b 0b 0c 1b 7c 19 7e 88 12 2a 08 0d 0a 0e \
    9d 9d 0a 12 2b 97 14 18 09 0f 9c 9e a9 a2 a3 12 \
    54 9b a8 9e 0a 0f 0f 2b 4f 97 18 0c 8e b1 0d b3 \
    b4 1b 34 ac 00 18 08 0c 0f 90 09 a6 c6 00 2a 45 \
    19 c1 3a 05 08 c9 0f 0d 0d 60 68 2d 95 ac 19 6f \
    d2 c8 0d 00 6c 07 94 3c b7 93 68 5f 5f e2 e3 8b \
    71 88 dc ec ea e3 f3 e3 48 82 72 2d f4 eb f4 ec \
    2c 72 32 fc 02 f2 63 61 09 88 88 3d 02 13 da db \
    b0 44 cc 8f 7d 01 df 48 44 e0 c4 88 10 30 09 e7 \
    49 4c b3 f0 07 90 3e fe 10 33 1e e8 56 11 86 8f \
    34 22 05 c2 99 81 63 4c ca 8c 77 ec d9 02 e1 30 \
    e4 cb 71 2b 7f 69 43 21 03 e1 4d 81 3b 5e 68 40 \
    f9 33 60 c7 99 1d 1c 16 55 38 83 4c 16 3c 4b 03 \
    3a 74 f7 41 c8 80 a8 52 83 82 e8 73 15 2b bd 41 \
    fe b6 56 f2 e9 f5 c0 d4 3e 26 04 30 48 a0 a5 ec \
    3c 1f 95 18 82 38 e5 48 00 d1 a8 9d e0 fe 72 6a \
    81 97 23 59 02 10 60 35 c0 a9 01 8b 04 0b 3e 20 \
    98 f5 57 01 db ae 45 09 2b 90 34 82 41 a7 0e d2 \
    fc 7e e2 a4 02 f2 4d 00 8e 12 08 c9 e5 88 82 a6 \
    5e 8d 1b 2f a8 f4 d3 00 e8 59 c8 d6 d2 55 80 60 \
    82 df d4 8d 3b b1 cd 70 37 a1 eb 53 bd 18 73 72 \
    54 1b 00 02 5d a9 1d a4 76 f9 b2 c0 2b 47 b3 1b \
    4b 58 3c 3c 77 ee dd 64 33 32 78 8e bb 31 02 ea \
    dd ab 73 4a d0 5b e5 86 e8 7f 95 a7 06 8f 5b 7d \
    63 9b f4 da 05 a0 eb de ba 72 f6 e1 ab 27 10 e9 \
    b0 58 fa ff 8d f1 67 82 1e 72 b8 89 16 ce 1b d1 \
    10 60 8f 7f f9 c9 52 5b 70 e1 b9 f7 80 68 4d 64 \
    c0 60 7d 8e 34 50 9c 71 df 04 27 5c 63 13 ea b5 \
    c3 76 e8 51 83 94 04 04 10 80 cc 8a 02 ce d2 40 \
    02 0c 58 55 c5 8c 55 d0 90 40 8b d4 30 70 a2 05 \
    29 32 b0 d6 8a 3e 56 b1 23 05 03 fc 08 e4 86 2f \
    f4 e0 63 90 7c 7d 40 c5 92 0c 34 39 41 04 00 3b"

    def __init__(self, app):
        super().__init__(app, "Button Test",None,None,DECOR_TITLE|DECOR_MINIMIZE|DECOR_MAXIMIZE|DECOR_CLOSE|DECOR_BORDER|DECOR_STRETCHABLE|DECOR_MENU,100,100,800,600)

        self.app = app

        # Quit
        FXMAPFUNC(self, SEL_CLOSE,    0,                                ButtonWindow.onCmdQuit),
        FXMAPFUNC(self, SEL_COMMAND,  ButtonWindow.ID_QUIT,             ButtonWindow.onCmdQuit),

        # Change or update icon/text relationship
        FXMAPFUNCS(self, SEL_COMMAND, ButtonWindow.ID_ICON_BEFORE_TEXT, ButtonWindow.ID_ICON_CENTER_VER, ButtonWindow.onCmdIconTextRelation),
        FXMAPFUNCS(self, SEL_UPDATE,  ButtonWindow.ID_ICON_BEFORE_TEXT, ButtonWindow.ID_ICON_CENTER_VER, ButtonWindow.onUpdIconTextRelation),

        # Change or update justification
        FXMAPFUNCS(self, SEL_COMMAND, ButtonWindow.ID_JUST_CENTER_X,    ButtonWindow.ID_JUST_VER_APART,  ButtonWindow.onCmdJustification),
        FXMAPFUNCS(self, SEL_UPDATE,  ButtonWindow.ID_JUST_CENTER_X,    ButtonWindow.ID_JUST_VER_APART,  ButtonWindow.onUpdJustification),

        FXMAPFUNC(self, SEL_COMMAND,  ButtonWindow.ID_TOOLBAR_STYLE,    ButtonWindow.onCmdToolbarStyle),

        # Tooltip
        FXToolTip(app)

        # Status bar
        statusbar = FXStatusBar(self,LAYOUT_SIDE_BOTTOM|LAYOUT_FILL_X|STATUSBAR_WITH_DRAGCORNER)

        # Controls on right
        controls = FXVerticalFrame(self,LAYOUT_SIDE_RIGHT|LAYOUT_FILL_Y|PACK_UNIFORM_WIDTH)

        # Separator
        FXVerticalSeparator(self,LAYOUT_SIDE_RIGHT|LAYOUT_FILL_Y|SEPARATOR_GROOVE)

        # Contents
        contents = FXHorizontalFrame(self,LAYOUT_SIDE_LEFT|FRAME_NONE|LAYOUT_FILL_X|LAYOUT_FILL_Y|PACK_UNIFORM_WIDTH,0,0,0,0,20,20,20,20)
        bp = bytes.fromhex(self.bigpenguin)
        icon = FXGIFIcon(app,bp,0,IMAGE_KEEP)

        # The button
        self.button = FXButton(contents,
                      "&This is a multi-line label on\na button to show off the full\ncapabilities of the button object\tIt also has a tooltip\n[which by the way can be multi-line also]\tAnd some helpful message for the status line.",
                      icon,
                      None,0,
                      FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_X|LAYOUT_CENTER_Y|LAYOUT_FIX_WIDTH|LAYOUT_FIX_HEIGHT,
                      0,0,300,200)

        group0 = FXGroupBox(controls,"Style",GROUPBOX_TITLE_CENTER|FRAME_RIDGE)
        FXCheckButton(group0,"Toolbar\tCool ``poppy'' style buttons",self,ButtonWindow.ID_TOOLBAR_STYLE)

        group1 = FXGroupBox(controls,"Horizontal Placement",GROUPBOX_TITLE_CENTER|FRAME_RIDGE)
        FXRadioButton(group1,"Before Text",self,ButtonWindow.ID_ICON_BEFORE_TEXT)
        FXRadioButton(group1,"After Text",self,ButtonWindow.ID_ICON_AFTER_TEXT)
        FXRadioButton(group1,"Centered",self,ButtonWindow.ID_ICON_CENTER_HOR)

        group2 = FXGroupBox(controls,"Vertical Placement",GROUPBOX_TITLE_CENTER|FRAME_RIDGE)
        FXRadioButton(group2,"Above Text",self,ButtonWindow.ID_ICON_ABOVE_TEXT)
        FXRadioButton(group2,"Below Text",self,ButtonWindow.ID_ICON_BELOW_TEXT)
        FXRadioButton(group2,"Centered",self,ButtonWindow.ID_ICON_CENTER_VER)

        group3 = FXGroupBox(controls,"Horizontal Justify",GROUPBOX_TITLE_CENTER|FRAME_RIDGE)
        FXRadioButton(group3,"Center",self,ButtonWindow.ID_JUST_CENTER_X)
        FXRadioButton(group3,"Left",self,ButtonWindow.ID_JUST_LEFT)
        FXRadioButton(group3,"Right",self,ButtonWindow.ID_JUST_RIGHT)
        FXRadioButton(group3,"Apart",self,ButtonWindow.ID_JUST_HOR_APART)

        group4 = FXGroupBox(controls,"Vertical Justify",GROUPBOX_TITLE_CENTER|FRAME_RIDGE)
        FXRadioButton(group4,"Center",self,ButtonWindow.ID_JUST_CENTER_Y)
        FXRadioButton(group4,"Top",self,ButtonWindow.ID_JUST_TOP)
        FXRadioButton(group4,"Bottom",self,ButtonWindow.ID_JUST_BOTTOM)
        FXRadioButton(group4,"Apart",self,ButtonWindow.ID_JUST_VER_APART)

        FXButton(controls,"&Quit",None,self,ButtonWindow.ID_QUIT,FRAME_RAISED|FRAME_THICK|LAYOUT_FILL_X|LAYOUT_BOTTOM)


    # Change the icon/text relationship
    def onCmdIconTextRelation(self, sender, sel, ptr):
        print("in onCmdIconTextRelation")
        style=self.button.getIconPosition()
        if FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_BEFORE_TEXT:
            style |= ButtonWindow.ICON_BEFORE_TEXT
            style&=~ICON_AFTER_TEXT
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_AFTER_TEXT:
            style |= ICON_AFTER_TEXT
            style &= ~ICON_BEFORE_TEXT
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_CENTER_HOR:
            style&=~ICON_AFTER_TEXT 
            style&=~ICON_BEFORE_TEXT
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_ABOVE_TEXT:
            style|=ICON_ABOVE_TEXT
            style&=~ICON_BELOW_TEXT
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_BELOW_TEXT:
            style|=ICON_BELOW_TEXT
            style&=~ICON_ABOVE_TEXT
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_CENTER_VER:
            style&=~ICON_ABOVE_TEXT
            style&=~ICON_BELOW_TEXT

        self.button.setIconPosition(style)
        return 1

    # Update icon/text relationship radio buttons
    def onUpdIconTextRelation(self, sender, sel, ptr):
        updatemessage=FXSEL(SEL_COMMAND,ButtonWindow.ID_UNCHECK)
        style=self.button.getIconPosition()
        if FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_BEFORE_TEXT:
            if((style&ICON_BEFORE_TEXT) and not(style&ICON_AFTER_TEXT)):
                updatemessage=FXSEL(SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_AFTER_TEXT:
            if(not(style&ICON_BEFORE_TEXT) and (style&ICON_AFTER_TEXT)):
                updatemessage=FXSEL(SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_CENTER_HOR:
            if(not(style&ICON_BEFORE_TEXT) and not(style&ICON_AFTER_TEXT)):
                updatemessage=FXSEL(SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_ABOVE_TEXT:
            if((style&ICON_ABOVE_TEXT) and not (style&ICON_BELOW_TEXT)):
                updatemessage=FXSEL(SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_BELOW_TEXT:
            if(not(style&ICON_ABOVE_TEXT) and not (style&ICON_BELOW_TEXT)):
                updatemessage=FXSEL(SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ButtonWindow.ID_ICON_CENTER_VER:
            if(not(style&ICON_ABOVE_TEXT) and not (style&ICON_BELOW_TEXT)):
                updatemessage=FXSEL(SEL_COMMAND,ButtonWindow.ID_CHECK)
        sender.handle(self,updatemessage,None)
        return 1

    # Change justification
    def onCmdJustification(self, sender, sel, ptr):
        print("onCmdJustification")
        style=self.button.getJustify()
        print("sel = ", sel)
        if FXSELID(sel) == ButtonWindow.ID_JUST_CENTER_X:
            style&=~JUSTIFY_HZ_APART
        elif FXSELID(sel) == ButtonWindow.ID_JUST_LEFT:
            style&=~JUSTIFY_HZ_APART
            style|=JUSTIFY_LEFT
        elif FXSELID(sel) == ButtonWindow.ID_JUST_RIGHT:
            style&=~JUSTIFY_HZ_APART
            style|=JUSTIFY_RIGHT
        elif FXSELID(sel) == ButtonWindow.ID_JUST_HOR_APART:
            style|=JUSTIFY_HZ_APART
        elif FXSELID(sel) == ButtonWindow.ID_JUST_CENTER_Y:
            style&=~JUSTIFY_VT_APART
        elif FXSELID(sel) == ButtonWindow.ID_JUST_TOP:
            style&=~JUSTIFY_VT_APART
            style|=JUSTIFY_TOP
        elif FXSELID(sel) == ButtonWindow.ID_JUST_BOTTOM:
            style&=~JUSTIFY_VT_APART
            style|=JUSTIFY_BOTTOM
        elif FXSELID(sel) == ButtonWindow.ID_JUST_VER_APART:
            style|=JUSTIFY_VT_APART
        print("justification style = ", style)
        self.button.setJustify(style)
        return 1

    # Update justification radio buttons
    def onUpdJustification(self, sender, sel, ptr):
        updatemessage=FXSEL(self, SEL_COMMAND,ButtonWindow.ID_UNCHECK)
        style=self.button.getJustify()
        if FXSELID(sel) == ButtonWindow.ID_JUST_CENTER_X:
            if(not(style&JUSTIFY_LEFT) and not (style&JUSTIFY_RIGHT)):
                updatemessage=FXSEL(self,SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ID_JUST_LEFT:
            if((style&JUSTIFY_LEFT) and not(style&JUSTIFY_RIGHT)):
                updatemessage=FXSEL(self,SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ID_JUST_RIGHT:
            if(not(style&JUSTIFY_LEFT) and (style&JUSTIFY_RIGHT)):
                updatemessage=FXSEL(self,SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ID_JUST_HOR_APART:
            if((style&JUSTIFY_LEFT) and (style&JUSTIFY_RIGHT)):
                updatemessage=FXSEL(self,SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ID_JUST_CENTER_Y:
            if(not(style&JUSTIFY_TOP) and not(style&JUSTIFY_BOTTOM)):
                updatemessage=FXSEL(self,SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ID_JUST_TOP:
            if((style&JUSTIFY_TOP) and not(style&JUSTIFY_BOTTOM)):
                updatemessage=FXSEL(self,SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ID_JUST_BOTTOM:
            if(not(style&JUSTIFY_TOP) and (style&JUSTIFY_BOTTOM)):
                updatemessage=FXSEL(self,SEL_COMMAND,ButtonWindow.ID_CHECK)
        elif FXSELID(sel) == ButtonWindow.ID_JUST_VER_APART:
            if((style&JUSTIFY_TOP) and (style&JUSTIFY_BOTTOM)):
                updatemessage=FXSEL(self,SEL_COMMAND,ButtonWindow.ID_CHECK)
        sender.handle(self,updatemessage,None,None, None)
        return 1

    # Set to toolbar style
    def onCmdToolbarStyle(self, sender, sel, ptr):
        print("onCmdToolbarStyle")
        style=self.button.getButtonStyle()
        if (ptr != None):
            style|=BUTTON_TOOLBAR
            self.button.setFrameStyle(FRAME_RAISED)
        else:
            style&=~BUTTON_TOOLBAR
            self.button.setFrameStyle(FRAME_RAISED|FRAME_THICK)

        self.button.setButtonStyle(style)
        return 1

    # Quit the application
    def onCmdQuit(self, sender, sel, ptr):
        #  FXFileStream stream
        #  stream.open("button.gui",FXStreamSave)
        #  getApp().writeWindow(stream,self)
        #  stream.close()
        self.app.exit(0)
        #  getApp().dumpWidgets()
        return 1


# Make application
application = FXApp("Button","FoxTest")

win = ButtonWindow(application)

# Create app
application.create()

win.show()

# Run
application.run()
