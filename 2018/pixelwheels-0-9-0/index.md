pub_date: 2018-07-04 23:09:09 +01:00
public: true
tags: [pixelwheels, gamedev]
title: PixelWheels 0.9.0, the one with gamepad support

This took way too long, but I finally found the time to release PixelWheels 0.9.0. I spent most of my time on improving input handling code to add gamepad support, especially the UI part. Gamepad support while racing pretty much worked out of the box after that.

<!-- break -->

Gamepad support is not complete yet: it still misses disconnection detection and a way to configure buttons, but you can at least navigate the UI with your gamepad and play the game, so the most important things are there. I plan to continue working on it in the next release.

Speaking of releases, I try to release a version every month, but I missed last month release train :( I did not want to miss another one, which is why I am releasing 0.9.0 even if gamepad support is not complete. With summer coming up it is quite possible that there won't be an end-of-July release: holidays and battling with my garden to keep it from turning into a jungle are going to keep me busy doing other things than working on PixelWheels.

Gamepad support is not the only changes in this release, though: a few weeks ago I did a test session with my colleagues and made a bunch of fixes afterwards:

- Steering is more progressive, making it easier to make small direction adjustments.

- Screen shakes less when spinning when playing with camera rotation disabled.

One thing that came up again during this session is how much people dislike the camera rotating to track the angle of the player vehicle. It's a feature I like a lot because it makes the game different from classic top-down racing games and because it is easier for younger players, but the pushback on this is so common that I am considering changing the default to not rotating the camera. What do you think?

Want to give it a try? Visit [PixelWheels page](/projects/pixelwheels), grab your gamepad and play this 0.9.0 release. Then let me know if you like it!
