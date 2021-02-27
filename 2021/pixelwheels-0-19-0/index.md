pub_date: 2021-02-26 19:48:26 +01:00
public: true
tags: [pixelwheels]
title: Pixel Wheels 0.19.0

[Pixel Wheels][game page] 0.19.0 is out! This is the first release of 2021, and it might be the last 0.x.0 release: the game is a bit light on content (12 vehicles, 6 tracks, 3 championships) but I want to "finish" this project so unless I change my mind, next version will be called 1.0.0.

## What's new in 0.19.0?

The most important change is... music!

I spent much time on [opengameart.org](https://opengameart.org) looking for free music and ended up picking 5 pieces from FoxSynergy:

- [Grey Sector v0.86](https://opengameart.org/content/grey-sector-8-bit)
- [Core Descent (16-bit)](https://opengameart.org/content/core-descent-16-bit)
- [Cosmo Blast v1.0](https://opengameart.org/content/cosmo-blast)
- [Lunar Harvest v1.0](https://opengameart.org/content/lunar-harvest)
- [Bouncing Baal v0.95](https://opengameart.org/content/bouncing-baal)

I was surprised how adding music really gave the game a more "finished" feeling:

<iframe width="560" height="315" src="https://www.youtube.com/embed/xriYt8K9lxw" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen>&nbsp;</iframe>
(_[View on Youtube](https://www.youtube.com/watch?v=xriYt8K9lxw)_)

<!-- break -->

## Anything else?

I made other changes like adding small animations here and there, making the game more lively. For example the flags behind the planes in the "championship finished" screen float, and the police car light bars flash. I tried to think of other not too obnoxious animations to add to the existing vehicles but haven't found any idea I liked so far, suggestions are welcome!

I also tuned the code responsible for picking which bonus you get when you hit a bonus crate so that you never get a turbo when you are at the first place. This should make getting best times less prone to randomness.

You can learn about the other changes from the [changelog for 0.19.0][changelog].

## Get it!

Get the game for Linux, macOS, Windows or Android from [Pixel Wheels page][game page].

[changelog]: https://github.com/agateau/pixelwheels/blob/0.19.0/CHANGELOG.md
[game page]: /projects/pixelwheels/
