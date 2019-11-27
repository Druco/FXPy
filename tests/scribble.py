###############################################################################
#                                                                             #
#                       Scribble  Application coding sample                   #
#                                                                             #
###############################################################################

from FXPy import *



# Main Window
class ScribbleWindow(FXMainWindow):
    (ID_CANVAS,
     ID_CLEAR,
     ID_LAST) = range(FXMainWindow.ID_LAST, FXMainWindow.ID_LAST+3)

    def __init__(self, app):
        super().__init__(app, "Scribble Application",None,None,DECOR_ALL,0,0,800,600)

        # Message Map for the Scribble Window class
        #________________Message_Type_____________________ID____________Message_Handler_______
        FXMAPFUNC(self, SEL_PAINT,             ScribbleWindow.ID_CANVAS, ScribbleWindow.onPaint)
        FXMAPFUNC(self, SEL_LEFTBUTTONPRESS,   ScribbleWindow.ID_CANVAS, ScribbleWindow.onMouseDown)
        FXMAPFUNC(self, SEL_LEFTBUTTONRELEASE, ScribbleWindow.ID_CANVAS, ScribbleWindow.onMouseUp)
        FXMAPFUNC(self, SEL_MOTION,            ScribbleWindow.ID_CANVAS, ScribbleWindow.onMouseMove)
        FXMAPFUNC(self, SEL_COMMAND,           ScribbleWindow.ID_CLEAR,  ScribbleWindow.onCmdClear)
        FXMAPFUNC(self, SEL_UPDATE,            ScribbleWindow.ID_CLEAR,  ScribbleWindow.onUpdClear)

        contents = FXHorizontalFrame(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X|LAYOUT_FILL_Y)

        # LEFT pane to contain the canvas
        canvasFrame = FXVerticalFrame(contents,FRAME_SUNKEN|LAYOUT_FILL_X|LAYOUT_FILL_Y|LAYOUT_TOP|LAYOUT_LEFT,0, 0, 0, 0, 10, 10, 10, 10)

        # Label above the canvas
        FXLabel(canvasFrame, "Canvas Frame", None, JUSTIFY_CENTER_X | LAYOUT_FILL_X)

        # Horizontal divider line
        FXHorizontalSeparator(canvasFrame,SEPARATOR_GROOVE|LAYOUT_FILL_X)

        # Drawing canvas
        self.canvas = FXCanvas(canvasFrame,self,ScribbleWindow.ID_CANVAS,FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X|LAYOUT_FILL_Y|LAYOUT_FILL_ROW|LAYOUT_FILL_COLUMN)

        # RIGHT pane for the buttons
        buttonFrame = FXVerticalFrame(contents,FRAME_SUNKEN|LAYOUT_FILL_Y|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,10,10)

        # Label above the buttons
        FXLabel(buttonFrame,"Button Frame",None,JUSTIFY_CENTER_X|LAYOUT_FILL_X)

        # Horizontal divider line
        FXHorizontalSeparator(buttonFrame,SEPARATOR_RIDGE|LAYOUT_FILL_X)

        # Button to clear
        FXButton(buttonFrame,"&Clear",None,self,ScribbleWindow.ID_CLEAR,FRAME_THICK|FRAME_RAISED|LAYOUT_FILL_X|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,5,5)

        # Exit button
        FXButton(buttonFrame,"&Exit",None,app,FXApp.ID_QUIT,FRAME_THICK|FRAME_RAISED|LAYOUT_FILL_X|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,5,5)

        # Initialize private variables
        self.drawColor = FXRGB(255,0,0)
        self.mdflag = 0
        self.dirty = 0

    # Mouse button was pressed somewhere
    def onMouseDown(self, sender, sel, ptr):
        self.canvas.grab()
        # While the mouse is down, we'll draw lines
        self.mdflag = 1

        return 1

    # The mouse has moved, draw a line
    def onMouseMove(self, sender, sel, ptr):
        ev = ptr
        # Draw
        if(self.mdflag):

            # Get DC for the canvas
            dc = FXDCWindow(self.canvas)

            # Set foreground color
            dc.setForeground(self.drawColor)

            # Draw line
            dc.drawLine(ev.last_x, ev.last_y, ev.win_x, ev.win_y)

            # We have drawn something, so now the canvas is dirty
            self.dirty = 1
        return 1


    # The mouse button was released again
    def onMouseUp(self, sender, sel, ptr):
        ev = ptr
        self.canvas.ungrab()
        if self.mdflag:
            dc = FXDCWindow(self.canvas)
            dc.setForeground(self.drawColor)
            dc.drawLine(ev.last_x, ev.last_y, ev.win_x, ev.win_y)

            # We have drawn something, so now the canvas is dirty
            self.dirty=1

            # Mouse no longer down
            self.mdflag=0
        return 1

    # Paint the canvas
    def onPaint(self, sender, sel, ptr):
        ev = ptr
        dc = FXDCWindow(self.canvas, ev)
        bgc = self.canvas.getBackColor()
        dc.setForeground(bgc)
        dc.fillRectangle(ev.rect.x,ev.rect.y,ev.rect.w,ev.rect.h)
        return 1

    # Handle the clear message
    def onCmdClear(self, sender, sel, ptr):
        dc = FXDCWindow(self.canvas)
        dc.setForeground(self.canvas.getBackColor())
        dc.fillRectangle(0,0,self.canvas.getWidth(),self.canvas.getHeight())
        self.dirty = 0
        return 1

    # Update the clear button:- each gui element (widget) in FOX
    # receives a message during idle processing asking it to be updated.
    # For example, buttons can be sensitized or desensitized when the
    # state of the application changes.
    # In this case, we desensitize the sender (the clear button) when
    # the canvas has already been cleared, and sensitize it when it has
    # been painted (as indicated by the dirty flag).
    def onUpdClear(self, sender, sel, ptr):
        if self.dirty:
            sender.handle(self, FXSEL(SEL_COMMAND,FXWindow.ID_ENABLE), None)
        else:
            sender.handle(self, FXSEL(SEL_COMMAND,FXWindow.ID_DISABLE), None)

        return 1

# Here we begin
# Make application
app = FXApp("Scribble","FoxTest")

# Scribble window
win = ScribbleWindow(app)

# Create the application's windows
app.create()

win.show()

# Run the application
app.run()
