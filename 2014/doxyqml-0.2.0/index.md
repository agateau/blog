pub_date: 2014-02-11 15:12:01 +01:00
public: true
tags: [doxyqml, qml, qt, doxygen]
title: "Doxyqml 0.2.0"
summary: |
    New release of Doxyqml, a tool to use Doxygen with QML code

I finally got around to release version 0.2.0 of [Doxyqml][], the Doxygen input filter to document QML code. This new version comes with the following changes:

- Support for `readonly` properties (Thanks to Burkhard Daniel) ;
- Support for anonymous function (Thanks to Niels Madan) ;
- Keep all comments. This makes it possible to use features like Doxygen `@cond`/`@endcond` blocks ;
- Improve handling of unknown arguments ;
- Add support for `\return` and `\param` in addition to `@return` and `@param` ;
- More tests.

Some of the changes have been sitting in Git for some months now so you may already have them. Others, like support for `@cond` / `@endcond` are more recent (like, last-week-recent).

That's it, you can now go back to write documentation for your code :)

[Doxyqml]: /projects/doxyqml
