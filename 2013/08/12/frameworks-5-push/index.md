pub_date: 2013-08-12 21:45:47 +02:00
public: true
tags: [KDE, KF5, Blue Systems]
title: "Frameworks 5 Push"
summary: |
    Blue Systems is running a three month push on KDE Frameworks 5.

In case you haven't heard of it, [KDE Frameworks 5][kf5] is an effort to port our existing kdelibs to Qt5 and split it into smaller components. This requires work in many areas: in addition to the actual porting (which is reasonably easy), dependencies between classes needs to be reduced, some of our classes are being deprecated and their features integrated into Qt5 itself, the code is being made more portable... This huge project is driven by awesome hackers Kévin Ottens and David Faure.

Back in Akademy, my Blue Systems colleague Alex Fiestas came up with a great idea: what if all Blue Systems developers switched to working exclusively on Frameworks for three months?

He did not have to work hard to convince us, and this is what most of us have been doing since the beginning of August.

I am quite happy with this push, it feels good to work on Frameworks. I have always felt a bit guilty that I was not contributing to it, blaming the usual lack-of-time and too-many-projects excuses.

You may remember I recently [announced I would be working on KDE-PIM][kdepim]. I still intend to do so, but this is put on hold until the end of the push. This means some of the changes I have in mind won't make it in KDE SC 4.12, but sometimes one has to shift priorities. The Frameworks project is critical, for KDE and KDE projects like Plasma Workspaces 2 but also for the whole Qt ecosystem: I am looking forward to see Qt-only applications being able to use our technologies, without fear of dragging too many dependencies.

[kf5]: http://community.kde.org/Frameworks
[kdepim]: /2013/06/20/getting-started-on-kdepim/
