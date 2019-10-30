
from FXPy import *


##
##  Example proportional layout using FXSpring widgets
##

# Create application object
application = FXApp("Ratio","FoxTest")

# Initialize and open display
# application.init(argc,argv)

# Create main window
main = FXMainWindow(application,"Ratio", None, None,DECOR_ALL,0,0,400,200,8,8,8,8,6,6)
  
# Add quit button and connect it to application
FXButton(main,"&Quit",None,application,FXApp.ID_QUIT,FRAME_RAISED|FRAME_THICK|LAYOUT_SIDE_BOTTOM|LAYOUT_CENTER_X,0,0,0,0,20,20,2,2)
  
# Label above it
FXLabel(main,"FXSpring can be used to keep widgets at fixed size ratios.\n\nResize the window to see how it behaves!",None,LAYOUT_SIDE_TOP|LAYOUT_FILL_X)

# Layout manager to place the springs  
horz = FXHorizontalFrame(main,FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X|LAYOUT_FILL_Y,0,0,0,0, 0,0,0,0, 0,0)

# First spring is set to behave normally in Y direction,
# but to have a ratio 1 for the X direction
spring1 = FXSpring(horz,LAYOUT_FILL_X|LAYOUT_FILL_Y,1,0, 0,0,0,0, 0,0,0,0)
label1 = FXLabel(spring1,"1",None,LAYOUT_FILL_X|LAYOUT_FILL_Y)
label1.setBackColor(FXRGB(255,0,0))

# Second spring has ratio 2 in the X direction
spring2 = FXSpring(horz,LAYOUT_FILL_X|LAYOUT_FILL_Y,2,0, 0,0,0,0, 0,0,0,0)
label2 = FXLabel(spring2,"2",None,LAYOUT_FILL_X|LAYOUT_FILL_Y)
label2.setBackColor(FXRGB(0,255,0))

# Second spring has ratio 3 in the X direction
spring3 = FXSpring(horz,LAYOUT_FILL_X|LAYOUT_FILL_Y,3,0, 0,0,0,0, 0,0,0,0)
label3 = FXLabel(spring3,"3",None,LAYOUT_FILL_X|LAYOUT_FILL_Y)
label3.setBackColor(FXRGB(0,0,255))

application.create()

main.show(PLACEMENT_SCREEN)

application.run()
