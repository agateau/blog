pub_date: 2018-09-12 21:39:43 +01:00
public: true
tags: [pixelwheels, gamedev]
title: Pixel Wheels 0.10.0!

Now that I am back from holidays (and from [Akademy][], which was awesome!), it's time to release a new version of Pixel Wheels!

[Akademy]: ../i-am-going-to-akademy

Here are the major changes coming with this release.

<!-- break -->

## Homing missile!

A new bonus, because everybody like bonuses! This time it's a homing missile. Usage is simple: after you picked it up, wait until a square indicator appears on top of the closest concurrent and fire the missile! Watch as the indicator gets red once the missile is locked on its target.

It can happen to you as well: if the red indicator appears over your vehicle, then it's time to try some evasive moves... the missile is not as smart as red shells thrown in a certain plumber game, so you can try to make it hit a wall (or another racer), or you can try to outrun it by triggering a turbo: the missile have a limited amount of fuel so if you manage to keep out of the way from long enough you can escape from it.

.. gallery ::
    - full: firing-missile.png
      alt: Fire!
    - full: this-is-going-to-hurt.png
      alt: This is going to hurt
    - full: missile-evolution.png
      alt: 3 different missile designs

## Some graphical changes

I redrew all the sprites using the edg32 palette from [ENDESGA][], giving a more cohesive result. I took the opportunity to adjust the design of the police car a bit after some player feedback telling me it was hard to figure out the front from the rear after the car had gone spinning.

I still have to redraw the level tiles though, and that's a pretty long work, so I am not done yet.

Also, to make it easier for you to grab those missiles (and the other bonuses!) I made the bonus crates bigger.

[ENDESGA]: https://twitter.com/ENDESGA

.. gallery ::
    - full: redesigned-vehicles.png
      alt: Redesigned vehicles
    - full: crates.png
      alt: Bigger crates

## More gameplay adjustments

I lowered the duration and power of the turbo and made other minor gameplay adjustments. It's starting to reach the point where I think it is playable, my benchmark for this being that my 9 year old played version 0.10.0 a lot recently, and he would not play a game just because daddy created it: it has to be fun!

I also changed the default settings to not rotate the screen to follow the player vehicle orientation by default. As much as I like this feature, almost every player prefers when the screen does not rotate, so let's change the default. It's still available as an option if you prefered the old way.

Mines and missiles can now be destroyed by gun bullets, and when you are racing with an undropped mine in your back, it can protect you from one hit (a gun bullet or a missile).

## Get it now!

As usual, you can grab desktop and Android archives on the [project page][pw] or install it from [Google Play][gp]. If you want to find out about the other changes, have a look at the [changelog][].

[pw]: /projects/pixelwheels
[gp]: https://play.google.com/apps/testing/com.agateau.tinywheels.android
[changelog]: https://github.com/agateau/pixelwheels/blob/0.10.0/CHANGELOG.md
