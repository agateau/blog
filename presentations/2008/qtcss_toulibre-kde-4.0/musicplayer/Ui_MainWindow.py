# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'MainWindow.ui'
#
# Created: Tue Jan 22 21:15:14 2008
#      by: PyQt4 UI code generator 4.3
#
# WARNING! All changes made in this file will be lost!

from PyQt4 import QtCore, QtGui

class Ui_MainWindow(object):
    def setupUi(self, MainWindow):
        MainWindow.setObjectName("MainWindow")
        MainWindow.resize(QtCore.QSize(QtCore.QRect(0,0,361,139).size()).expandedTo(MainWindow.minimumSizeHint()))

        self.vboxlayout = QtGui.QVBoxLayout(MainWindow)
        self.vboxlayout.setSpacing(0)
        self.vboxlayout.setMargin(0)
        self.vboxlayout.setObjectName("vboxlayout")

        self.playingLabel = QtGui.QLabel(MainWindow)
        self.playingLabel.setAlignment(QtCore.Qt.AlignCenter)
        self.playingLabel.setObjectName("playingLabel")
        self.vboxlayout.addWidget(self.playingLabel)

        self.buttonFrame = QtGui.QFrame(MainWindow)
        self.buttonFrame.setFrameShape(QtGui.QFrame.StyledPanel)
        self.buttonFrame.setFrameShadow(QtGui.QFrame.Raised)
        self.buttonFrame.setObjectName("buttonFrame")

        self.hboxlayout = QtGui.QHBoxLayout(self.buttonFrame)
        self.hboxlayout.setSpacing(0)
        self.hboxlayout.setContentsMargins(0,-1,0,-1)
        self.hboxlayout.setObjectName("hboxlayout")

        self.playButton = QtGui.QPushButton(self.buttonFrame)
        self.playButton.setIcon(QtGui.QIcon("media-playback-start.png"))
        self.playButton.setIconSize(QtCore.QSize(32,32))
        self.playButton.setObjectName("playButton")
        self.hboxlayout.addWidget(self.playButton)

        self.pauseButton = QtGui.QPushButton(self.buttonFrame)
        self.pauseButton.setIcon(QtGui.QIcon("media-playback-pause.png"))
        self.pauseButton.setIconSize(QtCore.QSize(32,32))
        self.pauseButton.setObjectName("pauseButton")
        self.hboxlayout.addWidget(self.pauseButton)

        self.stopButton = QtGui.QPushButton(self.buttonFrame)
        self.stopButton.setIcon(QtGui.QIcon("media-playback-stop.png"))
        self.stopButton.setIconSize(QtCore.QSize(32,32))
        self.stopButton.setObjectName("stopButton")
        self.hboxlayout.addWidget(self.stopButton)

        self.prevButton = QtGui.QPushButton(self.buttonFrame)
        self.prevButton.setIcon(QtGui.QIcon("media-skip-backward.png"))
        self.prevButton.setIconSize(QtCore.QSize(32,32))
        self.prevButton.setObjectName("prevButton")
        self.hboxlayout.addWidget(self.prevButton)

        self.nextButton = QtGui.QPushButton(self.buttonFrame)
        self.nextButton.setIcon(QtGui.QIcon("media-skip-forward.png"))
        self.nextButton.setIconSize(QtCore.QSize(32,32))
        self.nextButton.setObjectName("nextButton")
        self.hboxlayout.addWidget(self.nextButton)
        self.vboxlayout.addWidget(self.buttonFrame)

        self.timeVolumeFrame = QtGui.QFrame(MainWindow)
        self.timeVolumeFrame.setFrameShape(QtGui.QFrame.StyledPanel)
        self.timeVolumeFrame.setFrameShadow(QtGui.QFrame.Raised)
        self.timeVolumeFrame.setObjectName("timeVolumeFrame")

        self.hboxlayout1 = QtGui.QHBoxLayout(self.timeVolumeFrame)
        self.hboxlayout1.setContentsMargins(0,-1,0,-1)
        self.hboxlayout1.setObjectName("hboxlayout1")

        self.timeLabel = QtGui.QLabel(self.timeVolumeFrame)
        self.timeLabel.setPixmap(QtGui.QPixmap("player-time.png"))
        self.timeLabel.setObjectName("timeLabel")
        self.hboxlayout1.addWidget(self.timeLabel)

        self.timeSlider = QtGui.QSlider(self.timeVolumeFrame)

        sizePolicy = QtGui.QSizePolicy(QtGui.QSizePolicy.Expanding,QtGui.QSizePolicy.Fixed)
        sizePolicy.setHorizontalStretch(1)
        sizePolicy.setVerticalStretch(0)
        sizePolicy.setHeightForWidth(self.timeSlider.sizePolicy().hasHeightForWidth())
        self.timeSlider.setSizePolicy(sizePolicy)
        self.timeSlider.setProperty("value",QtCore.QVariant(15))
        self.timeSlider.setOrientation(QtCore.Qt.Horizontal)
        self.timeSlider.setObjectName("timeSlider")
        self.hboxlayout1.addWidget(self.timeSlider)

        self.volumeLabel = QtGui.QLabel(self.timeVolumeFrame)
        self.volumeLabel.setPixmap(QtGui.QPixmap("player-volume.png"))
        self.volumeLabel.setObjectName("volumeLabel")
        self.hboxlayout1.addWidget(self.volumeLabel)

        self.volumeSlider = QtGui.QSlider(self.timeVolumeFrame)
        self.volumeSlider.setProperty("value",QtCore.QVariant(99))
        self.volumeSlider.setOrientation(QtCore.Qt.Horizontal)
        self.volumeSlider.setObjectName("volumeSlider")
        self.hboxlayout1.addWidget(self.volumeSlider)

        self.themesButton = QtGui.QToolButton(self.timeVolumeFrame)
        self.themesButton.setIcon(QtGui.QIcon("theme.png"))
        self.themesButton.setIconSize(QtCore.QSize(22,22))
        self.themesButton.setPopupMode(QtGui.QToolButton.InstantPopup)
        self.themesButton.setObjectName("themesButton")
        self.hboxlayout1.addWidget(self.themesButton)
        self.vboxlayout.addWidget(self.timeVolumeFrame)

        self.retranslateUi(MainWindow)
        QtCore.QMetaObject.connectSlotsByName(MainWindow)

    def retranslateUi(self, MainWindow):
        MainWindow.setWindowTitle(QtGui.QApplication.translate("MainWindow", "Music Player", None, QtGui.QApplication.UnicodeUTF8))
        self.playingLabel.setText(QtGui.QApplication.translate("MainWindow", "Playing : Moby - 18", None, QtGui.QApplication.UnicodeUTF8))
        self.themesButton.setText(QtGui.QApplication.translate("MainWindow", "...", None, QtGui.QApplication.UnicodeUTF8))
        self.themesButton.setShortcut(QtGui.QApplication.translate("MainWindow", "Ctrl+R", None, QtGui.QApplication.UnicodeUTF8))

