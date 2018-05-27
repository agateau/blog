pub_date: 2015-12-20 21:31:01 +01:00
public: true
tags: [qt, tips]
title: QDir::Separator considered harmful
summary: |
    Why you should not use QDir::Separator, even for cross-platform code

Suppose you are building a Qt application which must run on Linux, Mac OS and Windows. At some point, your application is likely to have to deal with file paths. Working on your Linux machine, but caring about your Windows users, you might be tempted to construct a file path like this:

	QString filePath = someDir + QDir::separator() + "foo.ext";

Don't do this! Make your life simpler and just use:

	QString filePath = someDir + "/foo.ext";

As `QDir::separator()` [documentation][qdirsepdoc] says:

> You do not need to use this function to build file paths. If you always use "/", Qt will translate your paths to conform to the underlying operating system. If you want to display paths to the user using their operating system's separator use toNativeSeparators().

Using `QDir::separator()` can actually cause subtle platform-dependent bugs. Let's have a look at this code snippet:

    QString findBiggestFile(const QString &dirname)
    {
        QDir dir(dirname);
        int size = 0;
        QString path;
        Q_FOREACH(const QFileInfo &info, dir.entryInfoList(QDir::Files)) {
             if (info.size() > size) {
                  path = info.absoluteFilePath();
                  size = info.size();
             }
        }
        return path;
    }

So far so good. Now imagine you want to unit-test your code. You setup a set of files and expect the file named "file.big" to be the biggest, so you write something like this:

    void testFindBiggestFile()
    {
        QString result = findBiggestFile(mTestDir);
        QString expected = mTestDir + QDir::separator() + "file.big";
        QCOMPARE(biggestFile, expected);
    }

This test passes on a Linux system, but fails on a Windows system: `findBiggestFile()` returns a path created by `QFileInfo`, so assuming `mTestDir` is `C:/build/tests`, `result` will be `C:/build/tests/file.big`, but `expected` will be `C:/build/tests\file.big`.

This simpler test, on the other hand, works as expected, on all platforms:

    void testFindBiggestFile()
    {
        QString result = findBiggestFile(mTestDir);
        QString expected = mTestDir + "/file.big";
        QCOMPARE(biggestFile, expected);
    }

Though you might want to pass `expected` through `QDir::cleanPath()` so that if `mTestDir` ends with a slash, the test does not fail:

    void testFindBiggestFile()
    {
        QString result = findBiggestFile(mTestDir);
        QString expected = QDir::cleanPath(mTestDir + "/file.big");
        QCOMPARE(result, expected);
    }

## What about paths displayed in the user interface?

There are situations where you need to use native separators, for example when you are preparing paths which will be shown in your user interface or when you need to fork a process which expects native separators as command-line arguments.

In such situations, `QDir::separator()` is not a good idea either. It's simpler and more reliable to create the path with forward slashes, then pass it through [`QDir::toNativeSeparators()`][tonativesep]. This way you can be sure you won't let one forward slash go through.

[qdirsepdoc]: http://doc.qt.io/qt-5/qdir.html#separator
[tonativesep]: http://doc.qt.io/qt-5/qdir.html#toNativeSeparators