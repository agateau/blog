#!/usr/bin/env python
import os
import sys

from PyQt4.QtCore import *
from PyQt4.QtGui import *

from Ui_MainWindow import *


class MainWindow(QWidget):
	def __init__(self):
		QWidget.__init__(self)
		self.ui = Ui_MainWindow()
		self.ui.setupUi(self)

		self.themesBaseDir = os.path.join(os.getcwd(), "themes")
		self.themesMenu = QMenu(self)
		self.ui.themesButton.setMenu(self.themesMenu)
		QObject.connect(self.themesMenu, SIGNAL("aboutToShow()"), self.updateThemesMenu)


	def updateThemesMenu(self):
		self.themesMenu.clear()
		lst = os.listdir(self.themesBaseDir)
		lst.sort()
		for name in lst:
			themeDir = os.path.join(self.themesBaseDir, name)
			themeFile = os.path.join(themeDir, "style.css")
			if not os.path.exists(themeFile):
				continue
			action = self.themesMenu.addAction(QString.fromUtf8(name))
			QObject.connect(action, SIGNAL("triggered()"), self.selectTheme)


	def selectTheme(self):
		action = self.sender()
		themeName = unicode(action.text()).encode("utf8")
		themeDir = os.path.join(self.themesBaseDir, themeName)
		themeFile = os.path.join(themeDir, "style.css")

		css = file(themeFile).read()

		os.chdir(themeDir)
		qApp.setStyleSheet(css)


def main():
	app = QApplication(sys.argv)
	appDir = os.path.dirname(sys.argv[0])
	os.chdir(appDir)
	window = MainWindow()
	window.show()
	app.exec_()


if __name__=="__main__":
	main()
