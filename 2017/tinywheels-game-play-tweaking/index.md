pub_date: 2017-11-19 18:34:01 +01:00
public: true
tags: [pixelwheels]
title: Tiny Wheels Game Play Tweaking

[Tiny Wheels 0.3.0][tw030] has been released for 3 weeks now. So far the feedback I received can be sum up like this:

[tw030]: ../tinywheels-0-3-0

> Looks fun!

Yay!

> The screen rotation makes me sick

There is an option for you in the settings to disable screen rotation.

> Dude, it's (too) hard!

It is, indeed.

<!-- break -->

I made a few changes to make the game easier. First I added road markings for the curves, making it easier to prepare to turn. They look like this:

.. gallery ::
    :thumbsize: 400

    - full: road-marking-1.png
      alt: Approaching an hairpin curve
    - full: road-marking-2.png
      alt: More curves! Also note the more snowy pine trees.

Then I made the AI pilots drive a little slower if they are ahead of you, so you get a chance to catch up if you hit a wall. This needs to be done carefully so that the game does not become too easy, but it's still hard right now, so no worry.... Anyway, if Tiny Wheels ever get different difficulty levels, this would be disabled in the harder levels.

I also noticed how the cars become hard to steer while turbo is in action. I am going to rework steering to avoid that.

Hopefully all these will be in version 0.4.0. Stay tuned!
