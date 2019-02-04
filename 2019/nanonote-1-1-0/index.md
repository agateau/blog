pub_date: 2019-02-04 19:47:38 +01:00
public: true
tags: [nanonote, qt, pko]
title: Nanonote 1.1.0

Several interesting changes landed in Nanonote recently, time to release version 1.1.0.

There are a few fancy indentation improvements: pressing Tab when the cursor is at the beginning of a list item now indents the whole line, making it fast to create sub lists. Thanks to Daniel Laidig for this contribution. Conversely, pressing Enter on an empty list item now unindents the line, then remove the list bullet.

URL detection has been improved to allow the `+`, `%` and `~` characters. This should greatly reduce the number of partially highlighted URLs.

The application is now available in Spanish and French, thanks to Victorhck for the Spanish translation.

<!-- break -->

Deb, rpm and source packages are available on the [project release page](https://github.com/agateau/nanonote/releases/tag/1.1.0). I hope you like this new version!
