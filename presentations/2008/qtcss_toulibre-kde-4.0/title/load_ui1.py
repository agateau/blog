#!/usr/bin/env python
import sys

from PyQt4 import QtGui, QtCore, uic


print QtCore.QT_VERSION_STR
print QtCore.qVersion()
app = QtGui.QApplication(sys.argv)
widget = uic.loadUi("title.ui")
widget.show()
app.exec_()
