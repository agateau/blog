pub_date: 2018-12-01 17:50:20 +01:00
public: true
tags: [doxyqml, release-month, qt, qml, doxygen, pko]
title: Release month, Doxyqml 0.5.0

December just started, and this year I want to try to do something a bit similar to advent calendars: make a new release of one of my (too) many projects every weekend! This release month begins with the release of [Doxyqml](/projects/doxyqml) 0.5.0, an input filter to let you document your QML code using Doxygen.

<!-- break -->

Just like in [version 0.4.0](../doxyqml-0-4-0), most of the work has been done by other contributors, with me taking care of reviewing the code and improving project infrastructure (improving tests, adding coding style checks...). Here is the list of changes:

- Turn internal QML elements into private C++ members, see [README.md][gh] for details on how to use this. (Matthew Lam)
- Add support for `@returns`, a synonym for `@return`. (Max Paperno)
- Add support for trailing (inline) Doxygen comments for properties, signals, and methods (but not method parameters). (Max Paperno)
- Fix installation issues on Windows (Max Paperno)
- Improve test coverage and infrastructure (Aurélien Gâteau)
- Setup flake8 to enforce coding style (Aurélien Gâteau)

As usual, you can get it using pip:

```
pip3 install --upgrade doxyqml
```

Or download the [source code][gh].

That's it for this release, see you next weekend for a new release of another project...

[gh]: https://github.com/agateau/doxyqml
