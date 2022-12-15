public: true
pub_date: 2022-12-13 15:38:38 +01:00
tags: [pixelwheels]
title: Pixel Wheels 0.24.1

A few bugs managed to sneak in Pixel Wheels 0.24.0, nasty creatures... version 0.24.1 fixes them.

<!-- break -->

## The stretched display bug

The most reported one is [#296][]: when the display does not have a 16:9 ratio, the screen to select vehicles would stretch to fill the available space, and the buttons would not respond anymore. Quite annoying on wide devices.

I fixed it and modified the release check-list to ensure the game is tested on a non 16:9 display before releasing.

## The incomplete Chinese texts bug

Another annoying one is [#297][]: some Chinese texts were incomplete. That one is caused by me saving disk space... The complete Chinese font is 20MB, but Pixel Wheels does not need all the glyphs, so it ships with a subset of the font containing only the required glyphs. This brings the size down to 132KB, so the savings are significant. The drawback is: one must not forget to regenerate the font before a new release, because texts change... Guess what happened in 0.24.0...

I updated the font file and modified the translation part of the build system to check the font is up-to-date, so this should not happen again.

## The best bug!

Finally, the best bug has to be [#302][]. Unlike the others, this one is not a 0.24.0 regression, but it got reported shortly after the release, so the fix made it in 0.24.1.

I am not going to describe it, just have a look at this video :)

<video width="960" height="540" controls>
  <source src="/storage/blog/2022/pixelwheels-0.24.1-bridge-bug.webm" type="video/webm">
</video>
<br>

[#296]: https://github.com/agateau/pixelwheels/issues/296
[#297]: https://github.com/agateau/pixelwheels/issues/297
[#302]: https://github.com/agateau/pixelwheels/issues/302

## Install 0.24.1

Head over to [itch.io][] for 0.24.1 binaries. Version 0.24.1 should also soon be available on Flathub, F-Droid and Google Play!

[itch.io]: https://agateau.itch.io/pixelwheels
