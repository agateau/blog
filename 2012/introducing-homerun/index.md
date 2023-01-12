pub_date: 2012-11-14 17:37:30 +01:00
public: true
tags: [kde, plasma, homerun, launcher, qml]
title: Introducing Homerun
summary: |
    Introducing Homerun, a fullscreen launcher for the KDE Plasma Desktop.

Today I am happy to present you the result of a few months of Shaun Reich and I
work: Homerun, a fullscreen launcher.

Quoting the [homepage](http://userbase.kde.org/Homerun):

> Homerun is a fullscreen launcher with content organized in tabs. A tab is
> composed of several "sources". A source can provide one or more sections to a
> tab. Homerun comes with a few built-in sources, but custom sources can be
> written using libhomerun.

Homerun can be opened from its applet:

.. thumbimg:: homerun-home.png

Or used as a containment:

.. thumbimg:: homerun-containment.png

I also created a screencast explaining how it works:

<iframe width="420" height="315" src="http://www.youtube.com/embed/6WcllgzepRY" frameborder="0" allowfullscreen>
</iframe>

_can't see the video? [click here](https://www.youtube.com/watch?v=6WcllgzepRY)_

## Getting it

Homerun currently requires kdelibs 4.8, 0.2.0 will likely require 4.9 or 4.10.

Version 0.1.0 is now available from [download.kde.org](http://download.kde.org/unstable/homerun/src/homerun-0.1.0.tar.bz2).

Git repository is on [projects.kde.org](https://projects.kde.org/projects/playground/base/homerun/repository).
There is also a [nightly
PPA](https://launchpad.net/~blue-shell/+archive/homerun) for Kubuntu users.
Of courses, packages for other distributions are welcome.

For more information, check [Homerun homepage](http://userbase.kde.org/Homerun).

_Update:_ openSUSE packages are available from [software.opensuse.org](http://software.opensuse.org/package/homerun).

## What's next?

### Activities

Homerun could greatly benefit from integrating with KDE activity system. For
example I have a "Code" activity and a "Photo" activity, I would like to have
different favorite applications and places for each of them.

### More sources

The more sources we get the more useful Homerun is.

I have a few ideas in mind, for example a world-clock source showing time in
selected timezones (we are KDE: we need more clocks!), sources for Flickr or
Picasa would be nice as well, I am pretty sure you can find interesting ideas.

One could even create an Amazon source... Could be handy as long as it is not on
the Home tab :)

You can create sources using libhomerun. Generate the API documentation by
running `make dox` and have a look at the [helloworld example
source](https://projects.kde.org/projects/playground/base/homerun/repository/show/devdoc/helloworld?rev=homerun%2F0.1).
