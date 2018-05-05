pub_date: 2018-02-03 23:54:36 +01:00
public: true
tags: [pixelwheels]
title: "Pixel Wheels 0.6.0!"

Here comes a new release of Tiny, err, Pixel Wheels!

The first main topic of this release is of course, the renaming of the game to Pixel Wheels, as [announced earlier](../tinywheels-0-5-0).

![Pixel Wheels](/projects/pixelwheels/0.6.0/title.png)

The second main topic is sound effects. It was high time to work on sound effects because adding sound to your game tend to be very invasive for the code base, so the earlier the sound architecture is in, the better. I probably should have done it earlier, but luckily it was not too much of a pain to get it in.

Implementing sound in the code base is actually only half of the work. The other half is producing or finding good sounds. If you are not careful you can easily spent ours browsing [OpenGameArt.org](https://opengameart.org) sound sections or [Freesound](https://freesound.org). I actually took another approach, more compatible with the fact that I do most of my work offline, in the train: I used [sfxr][], a wonderful and fun tool by DrPetter to generate game sound effects. The user interface was a bit tedious to use, though, so I spent some time porting sfxr to QtQuick. You can find the end result in the [SFXR Qt repository][sfxr-qt]... Yay, another side project!

<!-- break -->

A few sounds are still missing, but the ones that are here already makes the game experience significantly better, if I may say so. I like the fact that since most of them come from SFXR, they sound a bit like 16-bit games. Generating sounds with SFXR is a lot of fun, it reminds me a bit of tweaking sounds on my Amstrad CPC with the SOUND, ENV and ENT Basic commands (oh the memories!)

Not all sounds come from SFXR however. Right now the engine sounds are real sample loops from OpenGameArt.org. I invested some time trying to synthesize the sound engine on the fly, but was not satisfied with the end result, so at least for now I am staying with those loops. I may revisit this topic later.

Get this noisy release from the [game page][pw], I hope you enjoy it!

[sfxr]: http://www.drpetter.se/project_sfxr.html
[sfxr-qt]: https://github.com/agateau/sfxr-qt
[pw]: /projects/pixelwheels/
