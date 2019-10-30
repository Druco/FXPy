
from FXPy import *


# Table Window
class TableWindow(FXMainWindow):
    (ID_TEST,
     ID_RESIZETABLE,
     ID_TABLE,
     ID_LAST) = range(FXMainWindow.ID_LAST, FXMainWindow.ID_LAST+4)
    

    penguin = "42 4d e2 00 00 00 00 00 00 00 52 00 00 00 28 00 \
  00 00 10 00 00 00 12 00 00 00 01 00 04 00 00 00 \
  00 00 90 00 00 00 6d 0b 00 00 6d 0b 00 00 07 00 \
  00 00 07 00 00 00 dc c0 b2 00 80 80 80 00 00 00 \
  00 00 c0 c0 c0 00 10 10 10 00 ff ff ff 00 08 a0 \
  e0 00 00 66 61 22 22 21 66 00 06 66 66 55 22 26 \
  66 60 66 66 65 55 55 26 66 66 66 66 65 55 55 36 \
  66 66 06 66 55 55 55 56 22 60 00 63 55 35 55 55 \
  22 20 00 23 55 35 55 55 22 20 00 02 55 33 55 55 \
  22 10 00 02 55 53 55 55 22 00 00 01 25 55 55 51 \
  21 00 00 00 21 55 55 52 10 00 00 00 02 66 55 22 \
  00 00 00 00 02 66 63 21 00 00 00 00 02 66 63 20 \
  00 00 00 00 02 42 25 20 00 00 00 00 02 32 32 20 \
  00 00 00 00 01 22 22 10 00 00 00 00 00 12 21 00 \
  00 00"


    # Make some windows
    def __init__(self, app):
        super().__init__(app,"Table Widget Test",None,None,DECOR_ALL,0,0,0,0)
        months = ["January","February","March","April","May","June","July","August","September","October","November","December"]
        
        # Map
        FXMAPFUNC(self, SEL_COMMAND,TableWindow.ID_TEST,TableWindow.onCmdTest),
        FXMAPFUNC(self, SEL_COMMAND,TableWindow.ID_RESIZETABLE,TableWindow.onCmdResizeTable),
        FXMAPFUNC(self, SEL_SELECTED,TableWindow.ID_TABLE,TableWindow.onTableSelected),
        FXMAPFUNC(self, SEL_DESELECTED,TableWindow.ID_TABLE,TableWindow.onTableDeselected),
        FXMAPFUNC(self, SEL_INSERTED,TableWindow.ID_TABLE,TableWindow.onTableInserted),
        FXMAPFUNC(self, SEL_DELETED,TableWindow.ID_TABLE,TableWindow.onTableDeleted),
        FXMAPFUNC(self, SEL_CHANGED,TableWindow.ID_TABLE,TableWindow.onTableChanged),
        FXMAPFUNC(self, SEL_REPLACED,TableWindow.ID_TABLE,TableWindow.onTableReplaced),

        # Tooltip
        tooltip=FXToolTip(app)

        icon = bytes.fromhex(self.penguin)
        penguinicon=FXBMPIcon(app,icon,FXRGB(192,192,192),IMAGE_ALPHAGUESS, 1,1)

        # Menubar
        menubar= FXMenuBar(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X)

        # Separator
        FXHorizontalSeparator(self,LAYOUT_SIDE_TOP|LAYOUT_FILL_X|SEPARATOR_GROOVE)

        # Contents
        contents= FXVerticalFrame(self,LAYOUT_SIDE_TOP|FRAME_NONE|LAYOUT_FILL_X|LAYOUT_FILL_Y)

        frame= FXVerticalFrame(contents,FRAME_SUNKEN|FRAME_THICK|LAYOUT_FILL_X|LAYOUT_FILL_Y, 0,0,0,0, 0,0,0,0)

        # Table
        table= FXTable(frame,self,TableWindow.ID_TABLE,TABLE_COL_SIZABLE|TABLE_ROW_SIZABLE|LAYOUT_FILL_X|LAYOUT_FILL_Y,0,0,0,0, 2,2,2,2)
        table.setVisibleRows(20)
        table.setVisibleColumns(8)
        #  table.setRowHeaderMode(0)
        table.setTableSize(50,14)
        table.setBackColor(FXRGB(255,255,255))
        table.setCellColor(0,0,FXRGB(255,255,255))
        table.setCellColor(0,1,FXRGB(255,240,240))
        table.setCellColor(1,0,FXRGB(240,255,240))
        table.setCellColor(1,1,FXRGB(240,240,255))

        # Initialize scrollable part of table
        for r in range(50):
            for c in range(14):
                table.setItemText(r,c,"r:"+r.__str__()+" c:"+c.__str__())

        # Initialize column headers
        for c in range(12):
            table.setColumnText(c,months[c])


        # Initialize row headers
        for r in range(50):
            table.setRowText(r,"Row"+r.__str__())

        table.setItemText(10,10,"This is multi-\nline text")
        table.setRowHeight(10,35)
        table.setItemJustify(10,10,FXTableItem.CENTER_X|FXTableItem.CENTER_Y)

        table.setItem(3,3,None)
        table.setItem(5,6,table.getItem(5,5))      # FIXME this is not the right way to make spanning cells
        table.setItem(5,7,table.getItem(5,5))
        table.setItemText(5,5,"Spanning Item")
        table.setItemJustify(5,5,FXTableItem.CENTER_X|FXTableItem.CENTER_Y)

        table.setItemBorders(9,9,FXTableItem.TBORDER|FXTableItem.LBORDER|FXTableItem.BBORDER)
        table.setItemBorders(9,10,FXTableItem.TBORDER|FXTableItem.RBORDER|FXTableItem.BBORDER)

        table.setItemJustify(10,5,FXTableItem.LEFT|FXTableItem.CENTER_Y)

        table.setItemBorders(40,13,FXTableItem.LBORDER|FXTableItem.TBORDER|FXTableItem.RBORDER|FXTableItem.BBORDER)
        table.setItemBorders(49,13,FXTableItem.LBORDER|FXTableItem.TBORDER|FXTableItem.RBORDER|FXTableItem.BBORDER)
        table.setItemBorders(5,0,FXTableItem.LBORDER|FXTableItem.TBORDER|FXTableItem.RBORDER|FXTableItem.BBORDER)

        table.setItemIcon(6,6,penguinicon)
        table.setItemIconPosition(6,6,FXTableItem.ABOVE)
        table.setItemJustify(6,6,FXTableItem.CENTER_X|FXTableItem.CENTER_Y)

        table.setItemStipple(3,4,STIPPLE_CROSSDIAG)

        table.setItem(10,2, FXComboTableItem("One\nTwo\nThree\nFour"))

        # File Menu
        filemenu= FXMenuPane(self)
        FXMenuCommand(filemenu,"&Quit\tCtl-Q",None,app,FXApp.ID_QUIT)
        FXMenuTitle(menubar,"&File",None,filemenu)

        # Tab side
        tablemenu= FXMenuPane(self)
        FXMenuCheck(tablemenu,"Horizontal grid",table,FXTable.ID_HORZ_GRID)
        FXMenuCheck(tablemenu,"Vertical grid",table,FXTable.ID_VERT_GRID)
        FXMenuCheck(tablemenu,"Editable",table,FXTable.ID_TOGGLE_EDITABLE)
        FXMenuTitle(menubar,"&Options",None,tablemenu)

        manipmenu= FXMenuPane(self)
        FXMenuCommand(manipmenu,"Edit Cell",None,table,FXTable.ID_START_INPUT)
        FXMenuCommand(manipmenu,"Delete Column",None,table,FXTable.ID_DELETE_COLUMN)
        FXMenuCommand(manipmenu,"Delete Row",None,table,FXTable.ID_DELETE_ROW)
        FXMenuCommand(manipmenu,"Insert Column",None,table,FXTable.ID_INSERT_COLUMN)
        FXMenuCommand(manipmenu,"Insert Row",None,table,FXTable.ID_INSERT_ROW)
        FXMenuCommand(manipmenu,"Resize table...",None,self,TableWindow.ID_RESIZETABLE)
        FXMenuTitle(menubar,"&Manipulations",None,manipmenu)

        selectmenu= FXMenuPane(self)
        FXMenuCommand(selectmenu,"Select All",None,table,FXTable.ID_SELECT_ALL)
        FXMenuCommand(selectmenu,"Select Cell",None,table,FXTable.ID_SELECT_CELL)
        FXMenuCommand(selectmenu,"Select Row",None,table,FXTable.ID_SELECT_ROW)
        FXMenuCommand(selectmenu,"Select Column",None,table,FXTable.ID_SELECT_COLUMN)
        FXMenuCommand(selectmenu,"Deselect All",None,table,FXTable.ID_DESELECT_ALL)
        FXMenuCommand(selectmenu,"Cut to clipboard",None,table,FXTable.ID_CUT_SEL)
        FXMenuCommand(selectmenu,"Copy to clipboard",None,table,FXTable.ID_COPY_SEL)
        FXMenuCommand(selectmenu,"Paste from clipboard",None,table,FXTable.ID_PASTE_SEL)
        FXMenuCommand(selectmenu,"Delete",None,table,FXTable.ID_DELETE_SEL)
        FXMenuTitle(menubar,"&Selection",None,selectmenu)


    # Test
    def onCmdTest(self, sender, sel, ptr):
        return 1


    # Resize table
    def onCmdResizeTable(self, sender, sel, ptr):
        dlg = FXDialogBox(self,"Resize Table")
        frame= FXHorizontalFrame(dlg,LAYOUT_FILL_X|LAYOUT_FILL_Y)
        FXLabel(frame,"Rows:",None,LAYOUT_SIDE_LEFT|LAYOUT_CENTER_Y)
        rows= FXTextField(frame,5,None,0,JUSTIFY_RIGHT|FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_LEFT|LAYOUT_CENTER_Y)
        FXLabel(frame,"Columns:",None,LAYOUT_SIDE_LEFT|LAYOUT_CENTER_Y)
        cols= FXTextField(frame,5,None,0,JUSTIFY_RIGHT|FRAME_SUNKEN|FRAME_THICK|LAYOUT_SIDE_LEFT|LAYOUT_CENTER_Y)
        FXButton(frame,"Cancel",None,dlg,FXDialogBox.ID_CANCEL,FRAME_RAISED|FRAME_THICK|LAYOUT_SIDE_LEFT|LAYOUT_CENTER_Y)
        FXButton(frame,"  OK  ",None,dlg,FXDialogBox.ID_ACCEPT,FRAME_RAISED|FRAME_THICK|LAYOUT_SIDE_LEFT|LAYOUT_CENTER_Y)
        oldnr=table.getNumRows()
        oldnc=table.getNumColumns()
        rows.setText(oldnr)
        cols.setText(oldnc)
        if dlg.execute():
            nr=rows.getText().__str__()
            nc=cols.getText().__str__()
            if nr<0:
                nr=0
            if nc<0:
                nc=0
            table.setTableSize(nr,nc)
            for r in range(nr):
                for c in range(nc):
                    table.setItemText(r,c,"r:"+FXStringVal(r+1)+" c:"+FXStringVal(c+1))
        return 1


    # Selected
    def onTableSelected(self, sender, sel, ptr):
        print("onTableSelected: ", type(ptr))
        #print((10,"SEL_SELECTED row=%d, col=%d\n",tp.row,tp.col))
        return 1

    # Deselected
    def onTableDeselected(self, sender, sel, ptr):
        print((10,"SEL_DESELECTED row=%d, col=%d\n",tp.row,tp.col))
        return 1

    # Inserted
    def onTableInserted(self, sender, sel, ptr):
        print((10,"SEL_INSERTED fm.row=%d, fm.col=%d to.row=%d, to.col=%d\n",tr.fm.row,tr.fm.col,tr.to.row,tr.to.col))
        return 1

    # Deleted
    def onTableDeleted(self, sender, sel, ptr):
        print("onTableDeleted: ", type(ptr))
        #print((10,"SEL_DELETED fm.row=%d, fm.col=%d to.row=%d, to.col=%d\n",tr.fm.row,tr.fm.col,tr.to.row,tr.to.col))
        return 1

    # Changed
    def onTableChanged(self, sender, sel, ptr):
        print((10,"SEL_CHANGED row=%d, col=%d\n",tp.row,tp.col))
        return 1

    # Replaced
    def onTableReplaced(self, sender, sel, ptr):
        print((10,"SEL_REPLACED fm.row=%d, fm.col=%d to.row=%d, to.col=%d\n",tr.fm.row,tr.fm.col,tr.to.row,tr.to.col))
        return 1


# Make application
application = FXApp("TableApp","FoxTest")

  # Make window
win = TableWindow(application)

# Create app
application.create()
win.show()

# Run
application.run()
