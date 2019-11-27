from FXPy import *
try:
    from OpenGL.GL import *
    from OpenGL.GLU import *
except:
    print("Sorry, couldn't import the PyOpenGL module.")
    raise SystemExit

# Timer setting (in milliseconds)
TIMER_INTERVAL = 100


class GLSettingsDialog(FXDialogBox):
    def __init__(self, owner, vis):
        super().__init__(owner,"OpenGL Info",DECOR_STRETCHABLE|DECOR_TITLE|DECOR_BORDER,0,0,600)

        m_master=FXVerticalFrame(self, LAYOUT_FILL_X|LAYOUT_FILL_Y, 0,0,0,0, 0,0,0,0)

        tabbook = FXTabBook(m_master,None,0,PACK_UNIFORM_WIDTH|PACK_UNIFORM_HEIGHT|LAYOUT_FILL_X|LAYOUT_FILL_Y|LAYOUT_RIGHT)

        #
        # Tab 1: general info
        #
        FXTabItem(tabbook, "General", None)
        frame1 = FXVerticalFrame(tabbook, LAYOUT_FILL_X|LAYOUT_FILL_Y|FRAME_THICK|FRAME_RAISED,0,0,0,0)

        # Opengl version information
        driverbox = FXGroupBox(frame1, "Driver", GROUPBOX_NORMAL|FRAME_RIDGE|LAYOUT_FILL_X)
        v_matrix=FXMatrix(driverbox, 2, MATRIX_BY_COLUMNS)

        FXLabel(v_matrix,"Vendor: ",None,LABEL_NORMAL)
        vendor_string = glGetString(GL_VENDOR).decode()
        FXLabel(v_matrix,vendor_string,None,LABEL_NORMAL)

        renderer_string = glGetString(GL_RENDERER)
        FXLabel(v_matrix,"Renderer: ",None,LABEL_NORMAL)
        FXLabel(v_matrix,renderer_string.decode(),None,LABEL_NORMAL)

        FXLabel(v_matrix,"GL Version: ",None,LABEL_NORMAL)
        FXLabel(v_matrix,glGetString(GL_VERSION).decode(),None,LABEL_NORMAL)

        FXLabel(v_matrix,"GLU Version: ",None,LABEL_NORMAL)
        FXLabel(v_matrix,gluGetString(GLU_VERSION).decode(),None,LABEL_NORMAL)

        # Opengl implementation-dependent stuff
        limitsbox= FXGroupBox(frame1, "Implementation limits", GROUPBOX_NORMAL|FRAME_RIDGE|LAYOUT_FILL_X)
        v_matrix2=FXMatrix(limitsbox, 2, MATRIX_BY_COLUMNS)

        intvals = glGetIntegerv(GL_MAX_VIEWPORT_DIMS)
        FXLabel(v_matrix2, "Maximum viewport size: ")
        FXLabel(v_matrix2, "{} x {}".format(intvals[0], intvals[1]))

        intval = glGetIntegerv(GL_MAX_TEXTURE_SIZE)
        FXLabel(v_matrix2, "Maximum texture size (w or h): ")
        FXLabel(v_matrix2, "{}".format(intval))

        intval = glGetIntegerv(GL_MAX_LIGHTS)
        FXLabel(v_matrix2, "Maximum number of lights: ")
        FXLabel(v_matrix2, "{}".format(intval))

        intval = glGetIntegerv(GL_MAX_CLIP_PLANES)
        FXLabel(v_matrix2, "Maximum number of clipping planes: ")
        FXLabel(v_matrix2, "{}".format(intval))

        intval = glGetIntegerv(GL_MAX_MODELVIEW_STACK_DEPTH)
        FXLabel(v_matrix2, "Maximum modelview-matrix stack depth: ")
        FXLabel(v_matrix2, "{}".format(intval))

        intval = glGetIntegerv(GL_MAX_PROJECTION_STACK_DEPTH)
        FXLabel(v_matrix2, "Maximum projection-matrix stack depth: ")
        FXLabel(v_matrix2, "{}".format(intval))

        intval = glGetIntegerv(GL_MAX_ATTRIB_STACK_DEPTH)
        FXLabel(v_matrix2, "Maximum attribute stack depth: ")
        FXLabel(v_matrix2, "{}".format(intval))

        options= FXHorizontalFrame(frame1,LAYOUT_SIDE_TOP|FRAME_NONE|LAYOUT_FILL_X|LAYOUT_FILL_Y,0,0,0,0,0,0,0,0)

        # Display mode info
        displaybox=FXGroupBox(options,"Display Mode",GROUPBOX_NORMAL|FRAME_RIDGE|LAYOUT_FILL_Y)
        mat=FXMatrix(displaybox, 2, MATRIX_BY_COLUMNS)

        FXLabel(mat,"Hardware-accelerated",None,LABEL_NORMAL)
        if vis.isAccelerated():
            FXLabel(mat,"yes",None,LABEL_NORMAL)
        else:
            FXLabel(mat,"no",None,LABEL_NORMAL)

        FXLabel(mat,"Double Buffering",None,LABEL_NORMAL)
        if vis.isDoubleBuffer():
            FXLabel(mat,"yes",None,LABEL_NORMAL)
        else:
            FXLabel(mat,"no",None,LABEL_NORMAL)

        FXLabel(mat,"Stereo View",None,LABEL_NORMAL)
        if vis.isStereo():
            FXLabel(mat,"yes",None,LABEL_NORMAL)
        else:
            FXLabel(mat,"no",None,LABEL_NORMAL)

        FXLabel(mat,"Buffer-swap by copy",None,LABEL_NORMAL)
        if vis.isBufferSwapCopy():
            FXLabel(mat,"yes",None,LABEL_NORMAL)
        else:
            FXLabel(mat,"no",None,LABEL_NORMAL)

        FXLabel(mat,"Color Depth",None,LABEL_NORMAL)
        FXLabel(mat,"{}".format(vis.getActualRedSize()+vis.getActualGreenSize()+vis.getActualBlueSize()+vis.getActualAlphaSize()))

        FXLabel(mat,"Depth Buffer Size",None,LABEL_NORMAL)
        FXLabel(mat,"{}".format(vis.getActualDepthSize()),None,LABEL_NORMAL)

        FXLabel(mat,"Stencil Buffer Size",None,LABEL_NORMAL)
        FXLabel(mat,"{}".format(vis.getActualStencilSize()),None,LABEL_NORMAL)

        FXLabel(mat,"RGBA",None,LABEL_NORMAL)
        FXLabel(mat,"{}-{}-{}-{}".format(vis.getActualRedSize(),vis.getActualGreenSize(),vis.getActualBlueSize(),vis.getActualAlphaSize()),None,LABEL_NORMAL)

        FXLabel(mat,"Accum RGBA",None,LABEL_NORMAL)
        FXLabel(mat,"{}-{}-{}-{}".format(vis.getActualAccumRedSize(),vis.getActualAccumGreenSize(),vis.getActualAccumBlueSize(),vis.getActualAccumAlphaSize()),None,LABEL_NORMAL)

        # List of extensions
        glextbox= FXGroupBox(options,"Available Extensions",GROUPBOX_NORMAL|FRAME_RIDGE|LAYOUT_FILL_Y|LAYOUT_FILL_X)
        listframe = FXVerticalFrame(glextbox,LAYOUT_FILL_X|LAYOUT_FILL_Y|FRAME_SUNKEN|FRAME_THICK,0,0,0,0, 0,0,0,0)

        extensionList = FXList(listframe,None,0,FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X|LAYOUT_FILL_Y)

        # Get OpenGL extensions
        tmp = glGetString(GL_EXTENSIONS)

        if tmp:
            text=tmp.split()
            for token in text:
                extensionList.appendItem("[GL] {}".format(token.decode()))
                #token=strtok(None," ")

        # Get GLU extensions
        tmp = gluGetString(GLU_EXTENSIONS)
        if tmp:
            text=tmp.split()
            for token in text:
                extensionList.appendItem("[GLU] {}".format(token.decode()))
        # Button frame
        control = FXHorizontalFrame(m_master, LAYOUT_SIDE_TOP|FRAME_NONE|LAYOUT_FILL_X)

        FXButton(control,"OK",None,self,FXDialogBox.ID_ACCEPT,FRAME_RAISED|FRAME_THICK|LAYOUT_CENTER_X|LAYOUT_CENTER_Y,0,0,0,0, 20,20,3,3)

# Event Handler Object
class GLTestWindow(FXMainWindow):
    (ID_CANVAS,
     ID_SPIN,
     ID_SPINFAST,
     ID_STOP,
     ID_TIMEOUT,
     ID_CHORE,
     ID_OPENGL) = range(FXMainWindow.ID_LAST, FXMainWindow.ID_LAST+7)

    def __init__(self, app):
        super().__init__(app,"OpenGL Test Application",None,None,DECOR_ALL,0,0,800,600)

        self.app = app

        # Message Map
        #_______________Message_Type_________ID_____________________Message_Handler_______
        FXMAPFUNC(self, SEL_PAINT,     GLTestWindow.ID_CANVAS,   GLTestWindow.onExpose)
        FXMAPFUNC(self, SEL_CONFIGURE, GLTestWindow.ID_CANVAS,   GLTestWindow.onConfigure)
        FXMAPFUNC(self, SEL_COMMAND,   GLTestWindow.ID_SPIN,     GLTestWindow.onCmdSpin)
        FXMAPFUNC(self, SEL_UPDATE,    GLTestWindow.ID_SPIN,     GLTestWindow.onUpdSpin)
        FXMAPFUNC(self, SEL_COMMAND,   GLTestWindow.ID_SPINFAST, GLTestWindow.onCmdSpinFast)
        FXMAPFUNC(self, SEL_UPDATE,    GLTestWindow.ID_SPINFAST, GLTestWindow.onUpdSpinFast)
        FXMAPFUNC(self, SEL_COMMAND,   GLTestWindow.ID_STOP,     GLTestWindow.onCmdStop)
        FXMAPFUNC(self, SEL_UPDATE,    GLTestWindow.ID_STOP,     GLTestWindow.onUpdStop)
        FXMAPFUNC(self, SEL_TIMEOUT,   GLTestWindow.ID_TIMEOUT,  GLTestWindow.onTimeout)
        FXMAPFUNC(self, SEL_CHORE,     GLTestWindow.ID_CHORE,    GLTestWindow.onChore)
        FXMAPFUNC(self, SEL_COMMAND,   GLTestWindow.ID_OPENGL,   GLTestWindow.onCmdOpenGL)

        # Construct a GLTestApp
        frame = FXHorizontalFrame(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X|LAYOUT_FILL_Y,0,0,0,0, 0,0,0,0)

        # LEFT pane to contain the glcanvas
        self.glcanvasFrame = FXVerticalFrame(frame,LAYOUT_FILL_X|LAYOUT_FILL_Y|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,10,10)

        # Label above the glcanvas
        FXLabel(self.glcanvasFrame,"OpenGL Canvas Frame",None,JUSTIFY_CENTER_X|LAYOUT_FILL_X)

        # Horizontal divider line
        FXHorizontalSeparator(self.glcanvasFrame,SEPARATOR_GROOVE|LAYOUT_FILL_X)

        # Drawing glcanvas
        glpanel = FXVerticalFrame(self.glcanvasFrame,FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X|LAYOUT_FILL_Y|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0, 0,0,0,0)

        # A Visual to drag OpenGL
        self.glvisual = FXGLVisual(self.app,VISUAL_DOUBLEBUFFER|VISUAL_STEREO)

        # Drawing glcanvas
        self.glcanvas = FXGLCanvas(glpanel,self.glvisual,self,GLTestWindow.ID_CANVAS,LAYOUT_FILL_X|LAYOUT_FILL_Y|LAYOUT_TOP|LAYOUT_LEFT)

        # RIGHT pane for the buttons
        buttonFrame = FXVerticalFrame(frame,LAYOUT_FILL_Y|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,10,10)

        # Label above the buttons
        FXLabel(buttonFrame,"Button Frame",None,JUSTIFY_CENTER_X|LAYOUT_FILL_X)

        # Horizontal divider line
        FXHorizontalSeparator(buttonFrame,SEPARATOR_RIDGE|LAYOUT_FILL_X)

        FXButton(buttonFrame,"&OpenGL Info\tDisplay OpenGL Capabilities",None,self,GLTestWindow.ID_OPENGL,FRAME_THICK|FRAME_RAISED|LAYOUT_FILL_X|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,5,5)
        # Button to print
        FXButton(buttonFrame,"Spin &Timer\tSpin using interval timers\nNote the app blocks until the interal has elapsed...",None,self,GLTestWindow.ID_SPIN,FRAME_THICK|FRAME_RAISED|LAYOUT_FILL_X|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,5,5)
        FXButton(buttonFrame,"Spin &Chore\tSpin as fast as possible using chores\nNote even though the app is very responsive, it never blocks\nthere is always something to do...",None,self,GLTestWindow.ID_SPINFAST,FRAME_THICK|FRAME_RAISED|LAYOUT_FILL_X|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,5,5)

        # Button to print
        FXButton(buttonFrame,"&Stop Spin\tStop self mad spinning, I'm getting dizzy",None,self,GLTestWindow.ID_STOP,FRAME_THICK|FRAME_RAISED|LAYOUT_FILL_X|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,5,5)

        # Exit button
        FXButton(buttonFrame,"&Exit\tExit the application",None,self.app,FXApp.ID_QUIT,FRAME_THICK|FRAME_RAISED|LAYOUT_FILL_X|LAYOUT_TOP|LAYOUT_LEFT,0,0,0,0,10,10,5,5)

        # Make a tooltip
        FXToolTip(app)

        # Initialize private variables
        self.spinning=0
        self.angle=0.0
        #self.drawScene()

    # Widget has been resized
    def onConfigure(self,sender,sel,ptr):
        if self.glcanvas.makeCurrent():
            glViewport(0,0,self.glcanvas.getWidth(),self.glcanvas.getHeight())
            self.glcanvas.makeNonCurrent()
        return 1

    # Widget needs repainting
    def onExpose(self,sender,sel,ptr):
        self.drawScene()
        return 1

    #  Rotate the boxes when a timer message is received
    def onTimeout(self,sender,sel,ptr):
        self.angle += 2.0
        if self.angle > 360.0:
            self.angle -= 360.0
        self.drawScene()
        self.app.addTimeout(self,GLTestWindow.ID_TIMEOUT,TIMER_INTERVAL)
        return 1

    # Rotate the boxes when a chore message is received
    def onChore(self,sender,sel,ptr):
        self.angle += 2.
        if self.angle > 360.:
            self.angle -= 360.
        self.drawScene()
        self.app.addChore(self,GLTestWindow.ID_CHORE)
        return 1

    # Start the boxes spinning
    def onCmdSpin(self,sender,sel,ptr):
        self.spinning=1
        self.app.addTimeout(self,GLTestWindow.ID_TIMEOUT,TIMER_INTERVAL)
        return 1

    # Enable or disable the spin button
    def onUpdSpin(self,sender,sel,ptr):
        button=sender
        if self.spinning:
            button.disable()
        else:
            button.enable()
        return 1

    # Start the boxes spinning
    def onCmdSpinFast(self,sender,sel,ptr):
        self.spinning = 1
        self.app.addChore(self,GLTestWindow.ID_CHORE)
        return 1

    # Enable or disable the spin button
    def onUpdSpinFast(self,sender,sel,ptr):
        button = sender
        if self.spinning:
            button.disable()
        else:
            button.enable()
        return 1

    # If boxes are spinning, stop them
    def onCmdStop(self,sender,sel,ptr):
        self.app.removeTimeout(self,GLTestWindow.ID_TIMEOUT)
        self.app.removeChore(self,GLTestWindow.ID_CHORE)
        self.spinning=0
        return 1

    # Enable or disable the stop button
    def onUpdStop(self,sender,sel,ptr):
        button = sender
        if self.spinning:
            button.enable()
        else:
            button.disable()
        return 1

    # Draws a simple box using the given corners
    def drawBox(self,xmin, ymin, zmin, xmax, ymax, zmax):
        glBegin(GL_TRIANGLE_STRIP)
        glNormal3f(0.,0.,-1.)
        glVertex3f(xmin, ymin, zmin)
        glVertex3f(xmin, ymax, zmin)
        glVertex3f(xmax, ymin, zmin)
        glVertex3f(xmax, ymax, zmin)
        glEnd()

        glBegin(GL_TRIANGLE_STRIP)
        glNormal3f(1.,0.,0.)
        glVertex3f(xmax, ymin, zmin)
        glVertex3f(xmax, ymax, zmin)
        glVertex3f(xmax, ymin, zmax)
        glVertex3f(xmax, ymax, zmax)
        glEnd()

        glBegin(GL_TRIANGLE_STRIP)
        glNormal3f(0.,0.,1.)
        glVertex3f(xmax, ymin, zmax)
        glVertex3f(xmax, ymax, zmax)
        glVertex3f(xmin, ymin, zmax)
        glVertex3f(xmin, ymax, zmax)
        glEnd()

        glBegin(GL_TRIANGLE_STRIP)
        glNormal3f(-1.,0.,0.)
        glVertex3f(xmin, ymin, zmax)
        glVertex3f(xmin, ymax, zmax)
        glVertex3f(xmin, ymin, zmin)
        glVertex3f(xmin, ymax, zmin)
        glEnd()

        glBegin(GL_TRIANGLE_STRIP)
        glNormal3f(0.,1.,0.)
        glVertex3f(xmin, ymax, zmin)
        glVertex3f(xmin, ymax, zmax)
        glVertex3f(xmax, ymax, zmin)
        glVertex3f(xmax, ymax, zmax)
        glEnd()

        glBegin(GL_TRIANGLE_STRIP)
        glNormal3f(0.,-1.,0.)
        glVertex3f(xmax, ymin, zmax)
        glVertex3f(xmax, ymin, zmin)
        glVertex3f(xmin, ymin, zmax)
        glVertex3f(xmin, ymin, zmin)
        glEnd()

    # Draw the GL scene
    def drawScene(self):
        lightPosition = [15.,10.,5.,1.]
        lightAmbient = [.1,.1,.1,1.]
        lightDiffuse = [.9,.9,.9,1.]
        redMaterial = [1.,0.,0.,1.]
        blueMaterial = [0.,0.,1.,1.]

        width = self.glcanvas.getWidth()
        height = self.glcanvas.getHeight()
        if height > 0:
            aspect = width/height
        else:
            aspect = 1.0

        # Make context current
        self.glcanvas.makeCurrent()

        glViewport(0,0,self.glcanvas.getWidth(),self.glcanvas.getHeight())

        glClearColor(1.0,1.0,1.0,1.0)
        glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT )
        glEnable(GL_DEPTH_TEST)

        glDisable(GL_DITHER)

        glMatrixMode(GL_PROJECTION)
        glLoadIdentity()
        gluPerspective(30.,aspect,1.,100.)

        glMatrixMode(GL_MODELVIEW)
        glLoadIdentity()
        gluLookAt(5.,10.,15.,0.,0.,0.,0.,1.,0.)

        glShadeModel(GL_SMOOTH)
        glLightfv(GL_LIGHT0, GL_POSITION, lightPosition)
        glLightfv(GL_LIGHT0, GL_AMBIENT, lightAmbient)
        glLightfv(GL_LIGHT0, GL_DIFFUSE, lightDiffuse)
        glEnable(GL_LIGHT0)
        glEnable(GL_LIGHTING)

        glMaterialfv(GL_FRONT, GL_AMBIENT, blueMaterial)
        glMaterialfv(GL_FRONT, GL_DIFFUSE, blueMaterial)

        glPushMatrix()
        glRotated(self.angle, 0., 1., 0.)
        self.drawBox(-1, -1, -1, 1, 1, 1)

        glMaterialfv(GL_FRONT, GL_AMBIENT, redMaterial)
        glMaterialfv(GL_FRONT, GL_DIFFUSE, redMaterial)

        glPushMatrix()
        glTranslated(0.,1.75,0.)
        glRotated(self.angle, 0., 1., 0.)
        self.drawBox(-.5,-.5,-.5,.5,.5,.5)
        glPopMatrix()

        glPushMatrix()
        glTranslated(0.,-1.75,0.)
        glRotated(self.angle, 0., 1., 0.)
        self.drawBox(-.5,-.5,-.5,.5,.5,.5)
        glPopMatrix()

        glPushMatrix()
        glRotated(90., 1., 0., 0.)
        glTranslated(0.,1.75,0.)
        glRotated(self.angle, 0., 1., 0.)
        self.drawBox(-.5,-.5,-.5,.5,.5,.5)
        glPopMatrix()

        glPushMatrix()
        glRotated(90., -1., 0., 0.)
        glTranslated(0.,1.75,0.)
        glRotated(self.angle, 0., 1., 0.)
        self.drawBox(-.5,-.5,-.5,.5,.5,.5)
        glPopMatrix()

        glPushMatrix()
        glRotated(90., 0., 0., 1.)
        glTranslated(0.,1.75,0.)
        glRotated(self.angle, 0., 1., 0.)
        self.drawBox(-.5,-.5,-.5,.5,.5,.5)
        glPopMatrix()

        glPushMatrix()
        glRotated(90., 0., 0., -1.)
        glTranslated(0.,1.75,0.)
        glRotated(self.angle, 0., 1., 0.)
        self.drawBox(-.5,-.5,-.5,.5,.5,.5)
        glPopMatrix()

        glPopMatrix()

        # Swap if it is double-buffered
        if self.glvisual.isDoubleBuffer():
            self.glcanvas.swapBuffers()

        # Make context non-current
        self.glcanvas.makeNonCurrent()

    # Pop a dialog showing OpenGL properties
    def onCmdOpenGL(self,sender,sel,ptr):
        self.glcanvas.makeCurrent()
        sd = GLSettingsDialog(self, self.glvisual)
        self.glcanvas.makeNonCurrent()
        sd.execute()
        return 1

# Here we begin
# Make application
application = FXApp("GLTest","FoxTest")

# Make window
win = GLTestWindow(application)

# Create the application's windows
application.create()

win.show()

# Run the application
application.run()
