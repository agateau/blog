pub_date: 2012-12-19 17:33:21 +01:00
public: true
tags: [KDE, homerun]
title: Homerun 0.1.1
summary: |
    Homerun 0.1.1 has been released, featuring a few bug fixes.

So while everybody is busy celebrating the release of [Qt 5][qt5]
(Congratulations!) Let me announce a much more modest release: [Homerun][homerun] 0.1.1.

This new version comes with one new feature: the ability to change the launcher
icon, and a few fixes:

- Fix "halt" action performing "log out" instead
- Fix memory leak when browsing folders
- Fix rootUrl appearing in PathModel if it did not end with a slash
- Fix crash when trying to add a tab to an empty model
- Fix crash if user tries to configure tabs while not on start page
- Fix category and website fields in desktop files

You can download the source from [download.kde.org][homerun-src]. Packages
should get updated soon.

[qt5]: http://blog.qt.digia.com/blog/2012/12/19/qt-5-0/
[homerun-src]: http://download.kde.org/unstable/homerun/src/homerun-0.1.1.tar.bz2
[homerun]: http://userbase.kde.org/Homerun
