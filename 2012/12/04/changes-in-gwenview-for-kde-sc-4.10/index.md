pub_date: 2012-12-04 23:50:12 +01:00
public: true
tags: [Gwenview, KDE]
title: Changes in Gwenview for KDE SC 4.10
summary: |
    Quite a few changes has been done to Gwenview in KDE SC 4.10. Find out about them.

I have been kept very busy during the last six months with
[Homerun](/2012/11/14/introducing-homerun/), spending little time on Gwenview. Luckily
Gwenview received several contributions from other developers during this cycle,
so Gwenview 2.10 (from KDE SC 4.10) features some significant improvements.

## Thumbnail view

Huge kudos to Benjamin Löwe for his work (among other bug fixes) on the
thumbnail views!

He introduced custom thumbnail ratios. Until now thumbnails have been drawn in
square cells. This often resulted in wasted space between rows. The thumbnails
cells now default to a 3:2 ratio, which look much better especially with
wide-screen pictures. If this is not clear, checkout the before/after
screenshot:

.. thumbimg:: thumbnail-ratio.png

This can be tweaked through an hidden configuration option:
`ThumbnailView/ThumbnailAspectRatio`. If you want to go back to the previous
format, set this key to 1.

Benjamin also improved thumbnail generation:

- Thumbnails for images are now generated *before* thumbnails for folders,
- Gwenview now starts generating thumbnails for fully visible thumbnails first,
  and takes care of partially visible thumbnails later
- The way Gwenview writes thumbnails on disk is now more efficient

As if it was not enough, he worked on ensuring thumbnail views scroll to show
the correct item in various situations, such as when starting Gwenview with an
image as an argument and the thumbnail bar is visible.

## Activity support

Another significant contribution came from Ivan Čukić, who added activity
support to Gwenview: Gwenview now reports opened documents to the activity
manager, making it possible to connect documents to activities using the
Share-Like-Connect applet.

## Color profile support

This feature has been wanted for a long time...

Work started at Akademy: after attending a color profile session in the
morning, I got cornered in the afternoon at the cafeteria by Boudewijn Rempt
and Kai-Uwe Behrmann... No way to escape any longer!

Boudewijn started the work during this afternoon, and I continued on it afterwards.

Currently Gwenview can:

- Read embedded color profiles from PNG and JPEG files.
- Use the image color profile together with the display color profile to output
  correct colors on the screen.

It currently misses (at least):

- Support for color profile in thumbnails. This is tricky to get right because
  thumbnails are shared among applications, which means Gwenview has no way to
  know if a thumbnail has been generated with correct color profiles.
- Support for reading color profiles from other image formats, such as TIFF.
- Color profile support for printing.

## Recursive importer

Until now, my main gripe with Gwenview importer was that it did not list
everything: one had to navigate through the folder tree of the camera
memory card to hunt for images. The experience is even worse when dealing
with a smartphone folder tree.

The new importer is a bit different: it is recursive. When you plug a device it
lists all images and videos. No need to know if they are stored in
"DCIM/FBAR1000" or "DCIM/FBAR1001".

In most case this is what you expect, but not always: plugging a smartphone is a
good example of a situation where you do not want to list all medias of the
device: The pictures you took with your phone are usually in a sub-folder of a
"DCIM" or a "Pictures" folder, but the phone contains many other folders filled
with application data which you do not want to list (unless you really
want to import that Angry Birds splash screen!)

Gwenview importer does not magically handle this for you, but tries to be
reasonably smart: it is possible to select the root folder to list, and it will
remember the last root folder for each device. This way, next time you plug
your smartphone in, only the relevant pictures and videos should be listed.

.. thumbimg:: importer-mess.png

_The importer showing covers of music albums on my phone (yes, I have odd musical tastes)_

.. thumbimg:: importer-picking-root-folder.png

_After clicking on the "Google File-CD Gadget" button, I can restrict the importer to list the content of the photo folder and its subfolders_

.. thumbimg:: importer.png

_Now only my test pictures are listed, and it will show up this way next time I plug the phone_

That's it for this version, hope you like it!
