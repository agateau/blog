public: yes
tags: []
comments: false
title: "Colibri"
summary: Colibri provides an alternative to KDE4 Plasma notifications.

## What is it?

Colibri provides an alternative to KDE Plasma 4 notifications.

Colibri notifications look lighter and are completely passive: they do not
provide any buttons. You may or may not like this.

Since they are completely passive, they smoothly fade away when you mouse over
them, allowing you to interact with any window behind them.

They also do not stack on top of each others: if multiple notifications happen,
they will be shown one at a time.

Note: I have no plan for now to port Colibri to KDE Plasma 5.

## Dependencies

You need kdelibs >= 4.4.

## Getting it

- Latest release: [colibri-0.3.0.tar.bz2][tarball].
- Git repository: `git://anongit.kde.org/colibri`

[tarball]: http://download.kde.org/stable/colibri/colibri-0.3.0.tar.bz2.mirrorlist

## Setting up your system to run Colibri

Colibri can be configured from its System Settings module.
If you need help follow the [setup guide](setup).

## Links

- [README](https://projects.kde.org/projects/playground/base/colibri/repository/revisions/master/entry/README)
- [NEWS](https://projects.kde.org/projects/playground/base/colibri/repository/revisions/master/entry/NEWS)
- [kde-apps.org page](http://kde-apps.org/content/show.php/Colibri?content=117147)

## A bit of history

Passive notifications for Plasma first appeared as "Ayatana notifications", an
alternative notification system I implemented in Kubuntu Karmic as part of my
work for Canonical.

Ayatana notifications were implemented as a patch against the systemtray
applet. Colibri is based on this work, but does not require patching any
applet.

Colibri contains code I wrote for Canonical, but it is not a Canonical product.
