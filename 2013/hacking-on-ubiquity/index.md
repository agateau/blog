pub_date: 2013-04-11 18:02:02 +02:00
public: true
tags: [KDE, Kubuntu, Ubiquity]
title: "Hacking on Ubiquity"
summary: |
    I worked a bit on Ubiquity, the Kubuntu Installer. This article presents some of the changes I made.

During this Kubuntu cycle, I worked a bit on Ubiquity. In case you don't know,
Ubiquity is the name of the Ubuntu installer. It is a frontend to the
debian-installer program and is used by many (all?) Ubuntu flavors. Ubiquity
itself has several frontends: a text frontend used by Ubuntu server, a GTK+
frontend used by Ubuntu and a Qt frontend used by Kubuntu.

My initial reason to get started to work on Ubiquity Qt frontend was a request
from Blue System to add the OS name to the partition manager, making it easier to
identify the content of the partitions when you manipulate them.

Every time I installed Kubuntu there was always a few pet peeves I thought I
should look into but I never took the time to do so. This was the occasion to
finally get some of those annoyances fixed.

The one bug which annoyed me the most was that text in the installer steps and
in the content was often truncated when installing in French, and I assume in
other languages as well. To fix this I had to rework the layout of the
installer itself, and this eventually snowballed into a whole new look.

I also refreshed a few screens, simplifying layouts here and there.

.. thumbimg:: ubiquity1.png
    :thumbsize: 500
    :alt: Ubiquity - Preparing

&nbsp;

.. thumbimg:: ubiquity2.png
    :thumbsize: 500
    :alt: Ubiquity - Disk Setup

_This new look turned up very similar to openSUSE 12.3 installer, but I
swear this is a coincidence! (openSUSE devs: why did you drop the green from the
sidebar? :)) I do confess getting some inspiration from openSUSE and Chakra
installers for the symbols in the step list, though._

The new installer is also no longer always running in fullscreen when used from
the live session. It runs as a regular, resizable window, making it easier to
continue using the live session while the installer is working.

.. thumbimg:: ubiquity-livesession.png
    :thumbsize: 500
    :alt: Ubiquity - Live Session

_(Getting some serious work done while installing)_

I also improved right-to-left support: more scripts now use the correct
direction and icons like the arrows in the previous and next buttons are
swapped accordingly.

.. thumbimg:: ubiquity-rtl.png
    :thumbsize: 500
    :alt: Ubiquity - in right-to-left mode

That's it for now, hope you like this refreshed installer. I already have
another list of things to change for 13.10, we'll see if I find time for them.
