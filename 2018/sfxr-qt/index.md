pub_date: 2018-02-09 19:59:10 +01:00
public: true
tags: [pixelwheels, sfxr-qt, pko]
title: SFXR Qt
summary: |
    I ported the venerable SFXR to QtQuick.

As I mentioned in my previous article about [adding sounds to Pixel Wheels][pw], I started yet-another side project: SFXR Qt. This is a QtQuick port of [SFXR][sfxr], a retro sound-effect generator by DrPetter.

.. thumbimg:: screenshot.png
    :thumbsize: 600
    :alt: SFXR Qt Screenshot

SFXR is a fun way to quickly generate old-school sound effects for your game, even if you are not a sound engineer. The generator buttons in the top-left area give you good starting points to create various sounds, and you can fiddle with the various sliders to adjust the sound to your liking.

## There are many forks/ports of SFXR, why another one?

I started the port for a few reasons:

First, the current UI is hard to use: something is wrong with the sliders, they do not follow the mouse. The UI is also super small on a HD screen.

Second, the other ports are all Flash-based, which I am not comfortable relying on.

But more important: I wanted to dive into sound generation a bit, and it was a fun way to get into this!

## Was it worth the pain?

I think so! I am happy with the way it sounds and it was fun to dive in an area I am not very experienced with. Furthermore I was able to make a few improvements to the user experience, such as automatically previewing sounds as you move the sliders, editing multiple sounds or adding a loop option.

You can ear some of the sound effects produced in this video of Pixel Wheels. All sounds have been generated with SFXR Qt, except for the engine and skidding sounds.

<iframe width="800" height="480" src="https://www.youtube.com/embed/c6YtA3l5Ej8" frameborder="0" allowfullscreen>
</iframe>
(_[View on Youtube](https://www.youtube.com/embed/c6YtA3l5Ej8)_)

## Where is the code?

SFXR Qt source code is on [GitHub][gh]. There are no pre-compiled binaries for now. I might look into creating some if there is enough demand.

Be advised that some parts of the code (*cough* core/synthesizer.cpp *cough*) are still a bit rough: SFXR is written in C, and I haven't ported everything to C++ yet.

[pw]: ../pixelwheels-0-6-0/
[gh]: https://github.com/agateau/sfxr-qt
[sfxr]: http://www.drpetter.se/project_sfxr.html
