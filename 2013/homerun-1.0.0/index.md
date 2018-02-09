pub_date: 2013-05-22 16:20:03 +02:00
public: true
tags: [KDE, Homerun]
title: "Homerun 1.0.0!"
summary: |
    Releasing Homerun 1.0.0, and passing maintainance over

## A New Release

Today, I am happy to announce the release of [Homerun][] 1.0.0. This new version
comes with a few new features.

Let's start with the biggest one: favorite reordering by drag and drop. This is
one of the most wanted feature requests for Homerun. It lets you reorder your
favorite applications and places by holding down the left mouse button and
dragging items around.

This short video demonstrates how it works:

<iframe width="560" height="315" src="http://www.youtube.com/embed/iE1sSaVw9pg?rel=0" frameborder="0" allowfullscreen>
</iframe>

This was surprisingly difficult to get right with QtQuick 1, so I am glad it's now
done.

Note that while this feature is currently only available for the "Favorite
Applications" and "Favorite Places" Homerun sources, it is actually possible for
any source to provide reordering via drag and drop if it makes sense for this
source to do so.

Another new feature is the ability to customize shortcuts. This started with
the idea of creating a cheatsheet of Homerun shortcuts, but I was worried the
list in the cheatsheet would not be kept up to date with the actual shortcuts
so I looked into generating the content of the cheatsheet from the code
handling the shortcuts. At one point I realized kdelibs already provided what I
wanted and more in the form of the standard shortcut dialog, so I scraped my
code and went for exposing the standard KDE shortcut dialog. You can reach it
from the configure menu in the top-right of the screen.

.. thumbimg:: shortcuts.png
    :alt: The shortcut dialog

Finally, other minor improvements have been made:

- The context menu of the "Trash" folder now has an "Empty Trash" entry,
- When an application or place is marked as a favorite, a short message appears
  on the top of the screen, reassuring you that your request has been taken into
  account.

As usual, this new release is available on [download.kde.org][dl].

## Moving On

This release is my last Homerun release: I am passing over maintenance
to Eike Hein, who you may know as the man behind [Konversation][konvi] and
[Yakuake][yakuake]. I am confident Homerun is in good hands with him.

As for me, I am going to return to what I enjoy most: working on applications.
In the next months I plan to get more involved in KDEPIM, starting with what I
do best: obsessing beyond reason about widgets layouts and margins. Once I feel
familiar enough with the code base, I'll try
to get a bit out of my comfort zone and help fixing underlying bugs.

[Homerun]: http://userbase.kde.org/Homerun
[konvi]: http://konversation.kde.org/
[yakuake]: http://extragear.kde.org/apps/yakuake/
[dl]: http://download.kde.org/stable/homerun/src/homerun-1.0.0.tar.bz2.mirrorlist
