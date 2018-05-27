pub_date: 2016-06-20 18:59:54 +01:00
public: true
tags: [doxyqml, qt, qml, doxygen]
title: Doxyqml 0.3.0 released
summary: |
    A new version of Doxyqml is out.

The master branch of [Doxyqml][], a QML input filter for Doxygen, had been waiting for a release for a long time. Olivier Churlaud, the new [KApidox][] hero, reported that it did not work with Python 3 and submitted a patch to fix this. I integrated his patch, fixed a few other things, set up Travis to test future commits and finally released Doxyqml 0.3.0, featuring the following changes:
                                  
- Port to Python 3 (Olivier Churlaud, Aurélien Gâteau)                              
- Skip directory imports (Aurélien Gâteau)                                          
- Support comment after class declaration (Cédric Cabessa)                          
- Find qmldir for relative paths (Mathias Hasselmann)                               
- Read import statements to help base class lookup (Mathias Hasselmann)             
- Generate qualified component names (Mathias Hasselmann)                           
- Handle singleton pragmas (Mathias Hasselmann)

Note that this new version is Python 3 only, I think it is safe to assume that Python 3 is widespread enough nowadays that this should not be a problem.

[Doxyqml]: /projects/doxyqml
[KApidox]: https://api.kde.org/frameworks/kapidox/html/