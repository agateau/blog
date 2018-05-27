pub_date: 2018-05-19 19:48:36 +01:00
public: true
tags: [doxyqml, qt, qml, doxygen, pko]
title: Doxyqml 0.4.0

After almost two years, here comes a new version of [Doxyqml](/projects/doxyqml), the QML filter for Doxygen. This new version adds a new command-line option: `--namespace` to wrap the generated C++ in a namespace, and makes the parser more robust. Nothing ground-breaking, but some nice changes nevertheless.

<!-- break -->

What's interesting with this project is that I don't use it these days, but it still receives contributions from time to time. This puts me in the unusual position (for me) where most of my contributions to the project are reviewing code, cleaning things, a bit of infrastructure (I just added code coverage checks: 88%, not too bad) and release management.

Surprisingly, I like doing this, I am happy to see this little tool remains useful enough that others keep it alive.

All that to say, you can now `pip install --upgrade doxyqml` to get the latest version, and enjoy documenting your QML components!
