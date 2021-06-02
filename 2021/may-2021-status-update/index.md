public: true
pub_date: 2021-06-02 09:11:06 +01:00
tags: [pixelwheels, git-bonsai]
title: May 2021 status update

This month I spent my time on Git Bonsai and Pixel Wheels.

## Git Bonsai

A user reported a bug with Git Bonsai: when working on a repository checkout with multiple work trees, Git Bonsai would crash ([#5](https://github.com/agateau/git-bonsai/issues/5)).

I fixed this and released [version 0.2.1](https://github.com/agateau/git-bonsai/releases/tag/0.2.1). This version fixes the crash and comes with reworked, more Rust-like error handling as I am still using the project to teach myself the Rust language.

## Pixel Wheels

The rest of my time was spent on Pixel Wheels. Here are the player-visible changes:

<!-- break -->

- Reworked the way broken records are reported to be less confusing: when the player breaks a record, the "record broken" indicators are now shown in the race score table, and a car drives from the bottom-right corner to congratulate them ([#111](https://github.com/agateau/pixelwheels/issues/111))

- Replaced the menu music with a new one called [Light Speed](https://github.com/agateau/pixelwheels/blob/cf8fb33239c9e333c7aa2180ef2d2f7a58c9485b/android/assets/musics/menu.mp3), by Thomas Tripon.

- Fixed gamepad support on Android ([#117](https://github.com/agateau/pixelwheels/issues/117)) and cleaned gamepad code a bit.

- Fixed two crashes:
    - Crash when trying to skip the "Championship finished" animation ([#118](https://github.com/agateau/pixelwheels/issues/118))
    - Crash when taking a screenshot on Windows ([#120](https://github.com/agateau/pixelwheels/issues/120))

I also did some work on the internals:

- Continued documenting gdxui and animscript. I'd like to record a video to show them in action later. I think the live-reload aspect of them (being able to adjust the UI and the animations while the game is running) would be interesting.

- Updated to libgdx 1.9.11 and gdx-controllers 2.2.0. This was required to fix gamepad support on Android, and is good in general.

## Support

I got my first Patreon supporter! He wishes to remain anonymous, so I am not going to name him, but thanks a lot to him!

## What to expect for June?

In June I plan to continue working on Pixel Wheels and release a new version. Contrary to what I wrote earlier, it's probably going to be a 0.20.0 because the list of what I want to include in 1.0.0 is not shrinking fast enough, so I think it's nicer to share intermediate releases with you.
