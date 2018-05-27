pub_date: 2013-04-23 00:20:11 +02:00
public: true
tags: [homerun, kde]
title: "Homerun 0.2.2 is out"
summary: |
    A new version of Homerun has been released, featuring one fix and translations

Just a quick note to let you know version 0.2.2 of [Homerun][] has been released.

This new version includes one often requested bug fix: the ability for the "Installed Apps" and "All Installed Apps" to refresh themselves when new applications are installed or uninstalled. Homerun 0.2.2 also ships with translations which have not been released in previous versions because of some mix up with release scripts :/ (It turns out if your application is not released as part of KDE SC, you should use [releaseme][], not [createtarball][])

You can get the new tarball from here: [homerun-0.2.2.tar.bz2][tarball], this version comes with:

- 8 complete translations: da, fi, lt, nl, pt, pt_BR, sv and uk
- 3 mostly complete ones (> 80%): es, ru, tr
- a bunch of other less complete ones

We plan a 0.2.3 release two weeks from now which should come with more complete translation coverage.

[Homerun]: http://userbase.kde.org/Homerun
[releaseme]: https://projects.kde.org/projects/playground/sdk/releaseme
[createtarball]: https://projects.kde.org/projects/kde/kdesdk/kde-dev-scripts/repository/revisions/master/show/createtarball
[tarball]: http://download.kde.org/unstable/homerun/src/homerun-0.2.2.tar.bz2
