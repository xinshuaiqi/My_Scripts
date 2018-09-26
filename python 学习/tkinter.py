# -*- coding: utf-8 -*-
"""
Created on Thu May 19 22:11:41 2016

@author: qxs
"""

#GUI Tkinter
import tkinter
top=tkinter.Tk()  # main GUI; name top

MainLabel=tkinter.Label(top,text="Hello qxs", font="Arial 16") #show label on top
MainLabel.pack()

ButtonInput=tkinter.Button(top,text="Input",command=inputstring)


top.mainloop()


#pyqt
import sys
from PyQt4 import QtGui

#create a small empty window
app = QtGui.QApplication(sys.argv)

widget = QtGui.QWidget()
widget.resize(250, 150)
widget.setWindowTitle('simple')
widget.show()

sys.exit(app.exec_())





