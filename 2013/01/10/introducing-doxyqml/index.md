public: false
tags: [QML, Doxygen, Python]
title: Introducing Doxyqml
summary: |
    This article presents Doxyqml, a tool which makes it possible to document QML classes with Doxygen.

[Doxygen][doxygen] is a very widespread tool to produce documentation from
source code. We use it in KDE to document our C++ libraries on [api.kde.org][].

Lately, we started to use [QML][qml] within KDE, especially in the Plasma
workspaces, where more and more Plasma applets get rewritten in QML. This means
we create more and more reusable QML components, which need to be documented.
Unfortunately, Doxygen does not support QML out of the box. That is the reason
why I created Doxyqml.

Doxyqml is a QML input filter for Doxygen, it uses Doxygen input filter
mechanism to turn QML into code which Doxygen can process.

Doxyqml has been deployed on api.kde.org, it is currently used to document the
[QML Plasma components][plasma-components-dox] which are shipped with kde-runtime.

## Getting it

You can get Doxyqml from its [project page][doxyqml].

## What about QDoc?

Qt QML components are documented with [QDoc][qdoc], I considered using it but
that can only be done by either:

Using Doxygen for C++ code and QDoc for QML. Not a good idea since it is
unlikely to produce a consistent documentation.

Or:

Migrating our existing C++ documentation to use QDoc. Not a good idea either
because it would mean giving up on Doxygen features we use which QDoc lacks,
like source code browsing or class diagrams.

[qml]: http://qt.digia.com/Product/qt-quick/
[doxygen]: http://doxygen.org
[api.kde.org]: http://api.kde.org
[doxyqml]: /projects/doxyqml
[plasma-components-dox]: http://api.kde.org/4.x-api/kde-runtime-apidocs/
[qdoc]: http://doc-snapshot.qt-project.org/qdoc3/index.html
