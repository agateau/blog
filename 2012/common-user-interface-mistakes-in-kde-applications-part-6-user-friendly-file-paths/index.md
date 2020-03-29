pub_date: 2012-10-07 18:12:27 +02:00
public: true
tags: [kde, ui]
title: "Common user interface mistakes in KDE applications, part 6: User-friendly file paths"
summary: |
    Quick tip on how to best present file paths in KDE applications

Hey, long time no addition to this [article series](/article-series/common-ui-mistakes-in-kde-applications/)...

This one is a quick tip: paths and urls in KDE applications are handled with the
[KUrl][] class. When one wants to show an URL to the user, it is tempting to use
the [prettyUrl()][prettyUrl] method, but the string returned by this method is
prefixed with "file://" for local urls, which is not something we should show
to the user. Instead, it is nicer to use [pathOrUrl()][pathOrUrl]. pathOrUrl()
calls prettyUrl() for remote urls and toLocalFile() for local ones.

This short code snippet shows the different behaviors:

.. sourcecode:: c++

    KUrl local("/home/user/Documents/foo.odt");

    kDebug() << local.prettyUrl();
    // prints "file:///home/user/Documents/foo.odt"

    kDebug() << local.pathOrUrl();
    // prints "/home/user/Documents/foo.odt"

    KUrl remote("http://www.kde.org");

    kDebug() << remote.prettyUrl();
    // prints "http://www.kde.org"

    kDebug() << remote.pathOrUrl();
    // prints "http://www.kde.org"

I recently fixed this in Kate code base, it is rather easy to grep your code for calls to
prettyUrl() and check if you would be better off with pathOrUrl(). There are actually very
few situations where one should use prettyUrl() instead of pathOrUrl().

I am going to file a request to update KUrl documentation so that this mistake is less
likely to happen.


[KUrl]: http://api.kde.org/4.9-api/kdelibs-apidocs/kdecore/html/classKUrl.html
[prettyUrl]: http://api.kde.org/4.9-api/kdelibs-apidocs/kdecore/html/classKUrl.html#a813a6cdf2990c80d55b02dd50a4800be
[pathOrUrl]: http://api.kde.org/4.9-api/kdelibs-apidocs/kdecore/html/classKUrl.html#a8d55e7b253e6184bc9f5a2844d98e561
